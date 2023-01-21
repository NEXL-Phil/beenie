import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ActivateWidget extends StatefulWidget {
  const ActivateWidget({
    Key? key,
    this.cardID,
  }) : super(key: key);

  final String? cardID;

  @override
  _ActivateWidgetState createState() => _ActivateWidgetState();
}

class _ActivateWidgetState extends State<ActivateWidget> {
  BeeniecardsRecord? beenieCard;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BeeniecardsRecord? beenieCardButton;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 300));

      final beeniecardsCreateData = createBeeniecardsRecordData(
        cardID: widget.cardID,
        owner: currentUserReference,
        linkedProfile: currentUserDocument!.profile,
        isActivated: false,
      );
      var beeniecardsRecordReference = BeeniecardsRecord.collection.doc();
      await beeniecardsRecordReference.set(beeniecardsCreateData);
      beenieCard = BeeniecardsRecord.getDocumentFromData(
          beeniecardsCreateData, beeniecardsRecordReference);

      final profilesUpdateData = createProfilesRecordData(
        linkedBeenieCard: beenieCard!.reference,
      );
      await currentUserDocument!.profile!.update(profilesUpdateData);

      context.pushNamed('Onboarding');
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 75, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(
                      maxWidth: 500,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 500,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 50, 0, 0),
                                  child: Text(
                                    'Activiating your card...',
                                    style: FlutterFlowTheme.of(context).title1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 330,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFFEBB108),
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.8, -0.65),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              currentUserDisplayName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.8, 0.55),
                                          child: Text(
                                            'Card ID',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.8, 0.8),
                                          child: Text(
                                            widget.cardID!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0x7EFFFFFF),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.91, 0.29),
                                          child: Image.network(
                                            'https://firebasestorage.googleapis.com/v0/b/nexl-business-card.appspot.com/o/public%2Fbeenie_bee%202.jpg?alt=media&token=1680160b-7b89-4a8b-8865-b76a8c0ffe12',
                                            width: 100,
                                            height: 176.1,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 75),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LinearPercentIndicator(
                                  percent: 1,
                                  width: 250,
                                  lineHeight: 24,
                                  animation: true,
                                  progressColor:
                                      FlutterFlowTheme.of(context).tertiary400,
                                  backgroundColor: Color(0xFFF1F4F8),
                                  center: Text(
                                    'Activating beenie card',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                  barRadius: Radius.circular(25),
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 35),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final beeniecardsCreateData =
                                    createBeeniecardsRecordData(
                                  cardID: widget.cardID,
                                  owner: currentUserReference,
                                  linkedProfile: currentUserDocument!.profile,
                                  isActivated: false,
                                );
                                var beeniecardsRecordReference =
                                    BeeniecardsRecord.collection.doc();
                                await beeniecardsRecordReference
                                    .set(beeniecardsCreateData);
                                beenieCardButton =
                                    BeeniecardsRecord.getDocumentFromData(
                                        beeniecardsCreateData,
                                        beeniecardsRecordReference);

                                final profilesUpdateData =
                                    createProfilesRecordData(
                                  linkedBeenieCard: beenieCardButton!.reference,
                                );
                                await currentUserDocument!.profile!
                                    .update(profilesUpdateData);

                                context.pushNamed('Onboarding');

                                setState(() {});
                              },
                              text: 'Next >',
                              options: FFButtonOptions(
                                width: 200,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
