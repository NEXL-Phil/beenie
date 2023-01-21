import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'contacts_record.g.dart';

abstract class ContactsRecord
    implements Built<ContactsRecord, ContactsRecordBuilder> {
  static Serializer<ContactsRecord> get serializer =>
      _$contactsRecordSerializer;

  @BuiltValueField(wireName: 'first_name')
  String? get firstName;

  @BuiltValueField(wireName: 'last_name')
  String? get lastName;

  @BuiltValueField(wireName: 'email_address')
  String? get emailAddress;

  @BuiltValueField(wireName: 'mobile_phone')
  String? get mobilePhone;

  @BuiltValueField(wireName: 'job_title')
  String? get jobTitle;

  @BuiltValueField(wireName: 'company_name')
  String? get companyName;

  @BuiltValueField(wireName: 'linkedIn_url')
  String? get linkedInUrl;

  String? get bio;

  @BuiltValueField(wireName: 'contact_image')
  String? get contactImage;

  @BuiltValueField(wireName: 'company_logo')
  String? get companyLogo;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ContactsRecordBuilder builder) => builder
    ..firstName = ''
    ..lastName = ''
    ..emailAddress = ''
    ..mobilePhone = ''
    ..jobTitle = ''
    ..companyName = ''
    ..linkedInUrl = ''
    ..bio = ''
    ..contactImage = ''
    ..companyLogo = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('contacts')
          : FirebaseFirestore.instance.collectionGroup('contacts');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('contacts').doc();

  static Stream<ContactsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ContactsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ContactsRecord._();
  factory ContactsRecord([void Function(ContactsRecordBuilder) updates]) =
      _$ContactsRecord;

  static ContactsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createContactsRecordData({
  String? firstName,
  String? lastName,
  String? emailAddress,
  String? mobilePhone,
  String? jobTitle,
  String? companyName,
  String? linkedInUrl,
  String? bio,
  String? contactImage,
  String? companyLogo,
}) {
  final firestoreData = serializers.toFirestore(
    ContactsRecord.serializer,
    ContactsRecord(
      (c) => c
        ..firstName = firstName
        ..lastName = lastName
        ..emailAddress = emailAddress
        ..mobilePhone = mobilePhone
        ..jobTitle = jobTitle
        ..companyName = companyName
        ..linkedInUrl = linkedInUrl
        ..bio = bio
        ..contactImage = contactImage
        ..companyLogo = companyLogo,
    ),
  );

  return firestoreData;
}
