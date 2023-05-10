import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/account_settings_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  var profileURL = '';
  // Stores action output result for [Backend Call - Create Document] action in addContact widget.
  ContactsRecord? newContact;
  // Stores action output result for [Custom Action - getPreCreatedProfile] action in Button widget.
  PreCreatedProfilesRecord? preProfDoc;
  // Stores action output result for [Custom Action - getBrandDetails] action in Button widget.
  PublicBrandingRecord? brandDoc;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
