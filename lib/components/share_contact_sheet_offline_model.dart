import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShareContactSheetOfflineModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for firstName widget.
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for lastName widget.
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for yourEmail widget.
  TextEditingController? yourEmailController;
  String? Function(BuildContext, String?)? yourEmailControllerValidator;
  // State field(s) for yourPhone widget.
  TextEditingController? yourPhoneController;
  String? Function(BuildContext, String?)? yourPhoneControllerValidator;
  // State field(s) for yourCompany widget.
  TextEditingController? yourCompanyController;
  String? Function(BuildContext, String?)? yourCompanyControllerValidator;
  // State field(s) for yourJobTitle widget.
  TextEditingController? yourJobTitleController;
  String? Function(BuildContext, String?)? yourJobTitleControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    firstNameController?.dispose();
    lastNameController?.dispose();
    yourEmailController?.dispose();
    yourPhoneController?.dispose();
    yourCompanyController?.dispose();
    yourJobTitleController?.dispose();
  }

  /// Additional helper methods are added here.

}
