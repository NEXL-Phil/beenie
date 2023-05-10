// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<QuerySnapshot> getProfileQuery(String email_address) async {
  QuerySnapshot document = await FirebaseFirestore.instance
      .collection('pre_created_profiles')
      .where('email_address', isEqualTo: email_address)
      .get();

  return document;
}

Future<PreCreatedProfilesRecord?> getPreCreatedProfile(String email) async {
  QuerySnapshot query = await getProfileQuery(email);

  if (query.size > 0) {
    DocumentReference<Object?>? docRef = query.docs.first.reference;
    return PreCreatedProfilesRecord.getDocumentOnce(docRef);
  } else {
    return null;
  }
}
