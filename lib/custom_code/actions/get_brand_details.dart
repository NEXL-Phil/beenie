// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<QuerySnapshot> getBrandQuery(String c_name) async {
  QuerySnapshot document = await FirebaseFirestore.instance
      .collection('public_branding')
      .where('company_domain', isEqualTo: c_name)
      .get();

  return document;
}

Future<PublicBrandingRecord?> getBrandDetails(String companydomain) async {
  QuerySnapshot query = await getBrandQuery(companydomain);

  if (query.size > 0) {
    DocumentReference<Object?>? docRef = query.docs.first.reference;
    return PublicBrandingRecord.getDocumentOnce(docRef);
  } else {
    return null;
  }
}
