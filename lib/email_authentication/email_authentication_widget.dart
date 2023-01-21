import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailAuthenticationWidget extends StatefulWidget {
  const EmailAuthenticationWidget({Key? key}) : super(key: key);

  @override
  _EmailAuthenticationWidgetState createState() =>
      _EmailAuthenticationWidgetState();
}

class _EmailAuthenticationWidgetState extends State<EmailAuthenticationWidget> {
  InstantTimer? checkActivationTimer;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      checkActivationTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          if (currentUserEmailVerified) {
            checkActivationTimer?.cancel();

            context.pushNamed('Home');

            return;
          } else {
            return;
          }
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    checkActivationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/images/Nexl_Final_File_V3_No_Border.png',
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          alignment: AlignmentDirectional(-1, 0),
                          child: Text(
                            'Please verify your email',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(),
                            child: Text(
                              'Check your inbox for your verification email .  It might be in your spam folder.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (!FFAppState().reSent)
                          InkWell(
                            onTap: () async {
                              await sendEmailVerification();
                              FFAppState().update(() {
                                FFAppState().reSent = true;
                              });
                            },
                            child: Text(
                              'Resend email verification link',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        if (FFAppState().reSent)
                          Icon(
                            Icons.check_circle,
                            color: FlutterFlowTheme.of(context).tertiary400,
                            size: 100,
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 50, 12, 12),
                    child: InkWell(
                      onTap: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await signOut();

                        context.goNamedAuth('SignUp', mounted);
                      },
                      child: Text(
                        'Log Out',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
