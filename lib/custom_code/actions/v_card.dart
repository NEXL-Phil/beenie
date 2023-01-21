// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_storage/firebase_storage.dart';

import 'package:vcard_maintained/vcard_maintained.dart';
import 'package:download/download.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

Future<String?> vCard(
    DocumentReference? userRef, DocumentReference? profileRef) async {
  var vCard = VCard();

  DocumentSnapshot? proDoc = await getProfileDoc(profileRef!.id);

  ///Set properties
  vCard.email = proDoc?.get("email_address");
  vCard.firstName = proDoc?.get("first_name");
  vCard.lastName = proDoc?.get("last_name");
  vCard.organization = proDoc?.get("company_name");

  vCard.workPhone = proDoc?.get("direct_line");
  vCard.cellPhone = proDoc?.get("mobile_phone");
  vCard.note = proDoc?.get("bio");
  vCard.url = proDoc?.get("linkedIn_url");
  vCard.jobTitle = proDoc?.get("job_title");
  vCard.homeAddress.countryRegion = proDoc?.get("country");

  vCard.photo.embedFromFile(proDoc?.get("profile_image"));

  /// Get formatted vCard
  /// @return {String} Formatted vCard in VCF format
  String contents = vCard.getFormattedString();
  String? userId = userRef?.id;

  final storageRef = FirebaseStorage.instance.ref();
  final newvCardRef = storageRef.child("users/" + userId! + "/" + "vCard.vcf");

  try {
    await newvCardRef.putString(contents);
  } on FirebaseException catch (e) {
    print("Error creating vCard");
  }

  return await newvCardRef.getDownloadURL();

  /// return "https://nexl.cloud";

  // data.toString().codeUnits
  /// final stream = Stream.fromIterable(contents.codeUnits);

  /// Save to file
  /// download(stream, 'contact.vcf');

  /// Get as formatted string
  /// print(vCard.getFormattedString());
}

Future<DocumentSnapshot?> getProfileDoc(String profileID) async {
  DocumentSnapshot? profileDoc = await FirebaseFirestore.instance
      .collection('profiles')
      .doc(profileID)
      .get();
  return profileDoc;
}
