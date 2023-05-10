import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getBeenieCardReference] action in editProfileCopy widget.
  BeeniecardsRecord? beenieCard;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  Color? colorPicked1;
  Color? colorPicked2;
  Color? colorPicked3;
  // State field(s) for companyName widget.
  TextEditingController? companyNameController;
  String? Function(BuildContext, String?)? companyNameControllerValidator;
  // State field(s) for jobTitle widget.
  final jobTitleKey = GlobalKey();
  TextEditingController? jobTitleController;
  String? jobTitleSelectedOption;
  String? Function(BuildContext, String?)? jobTitleControllerValidator;
  // State field(s) for country widget.
  final countryKey = GlobalKey();
  TextEditingController? countryController;
  String? countrySelectedOption;
  String? Function(BuildContext, String?)? countryControllerValidator;
  // State field(s) for yourOfficePhone widget.
  TextEditingController? yourOfficePhoneController;
  String? Function(BuildContext, String?)? yourOfficePhoneControllerValidator;
  // Stores action output result for [Custom Action - vCard] action in Button widget.
  String? vCardUrl;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    companyNameController?.dispose();
    yourOfficePhoneController?.dispose();
  }

  /// Additional helper methods are added here.

}
