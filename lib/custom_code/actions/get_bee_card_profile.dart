// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<QuerySnapshot?> getBeeQuery(String cardID) async {
  QuerySnapshot? document = await FirebaseFirestore.instance
      .collection('beeniecards')
      .where('cardID', isEqualTo: cardID)
      .get();
  return document;
}

Future<DocumentSnapshot?> getBeeDoc(String cardID) async {
  QuerySnapshot? query = await getBeeQuery(cardID);
  return query?.docs.first;
}

Future<DocumentReference?> getBeeCardProfile(String cardID) async {
  DocumentSnapshot? bc = await getBeeDoc(cardID);
  return bc?.get("linkedProfile");
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
