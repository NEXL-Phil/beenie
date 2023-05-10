import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'activate_model.dart';
export 'activate_model.dart';

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
  late ActivateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivateModel());

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
      _model.beenieCard = BeeniecardsRecord.getDocumentFromData(
          beeniecardsCreateData, beeniecardsRecordReference);

      final profilesUpdateData = createProfilesRecordData(
        linkedBeenieCard: _model.beenieCard!.reference,
      );
      await currentUserDocument!.profile!.update(profilesUpdateData);

      context.pushNamed('Onboarding');
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 75.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    constraints: BoxConstraints(
                      maxWidth: 500.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 500.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 50.0, 0.0, 0.0),
                                  child: Text(
                                    'Activating your card...',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 330.0,
                                  height: 180.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFFEBB108),
                                    elevation: 6.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
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
                                                      .displaySmall
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
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 14.0,
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
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0x7EFFFFFF),
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.91, 0.29),
                                          child: Image.network(
                                            'https://firebasestorage.googleapis.com/v0/b/nexl-business-card.appspot.com/o/public%2Fbeenie_bee%202.jpg?alt=media&token=1680160b-7b89-4a8b-8865-b76a8c0ffe12',
                                            width: 100.0,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 75.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LinearPercentIndicator(
                                  percent: 1.0,
                                  width: 250.0,
                                  lineHeight: 24.0,
                                  animation: true,
                                  progressColor:
                                      FlutterFlowTheme.of(context).tertiary400,
                                  backgroundColor: Color(0xFFF1F4F8),
                                  center: Text(
                                    'Activating beenie card',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                  barRadius: Radius.circular(25.0),
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 35.0),
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
                                _model.beenieCardButton =
                                    BeeniecardsRecord.getDocumentFromData(
                                        beeniecardsCreateData,
                                        beeniecardsRecordReference);

                                final profilesUpdateData =
                                    createProfilesRecordData(
                                  linkedBeenieCard:
                                      _model.beenieCardButton!.reference,
                                );
                                await currentUserDocument!.profile!
                                    .update(profilesUpdateData);

                                context.pushNamed('Onboarding');

                                setState(() {});
                              },
                              text: 'Next >',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FFAppState().maincolorstate,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
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
