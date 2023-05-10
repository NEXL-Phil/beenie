import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailAuthenticationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  InstantTimer? checkActivationTimer;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    checkActivationTimer?.cancel();
  }

  /// Additional helper methods are added here.

}
