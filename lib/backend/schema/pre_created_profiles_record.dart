import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pre_created_profiles_record.g.dart';

abstract class PreCreatedProfilesRecord
    implements
        Built<PreCreatedProfilesRecord, PreCreatedProfilesRecordBuilder> {
  static Serializer<PreCreatedProfilesRecord> get serializer =>
      _$preCreatedProfilesRecordSerializer;

  @BuiltValueField(wireName: 'linkedIn_url')
  String? get linkedInUrl;

  @BuiltValueField(wireName: 'first_name')
  String? get firstName;

  @BuiltValueField(wireName: 'last_name')
  String? get lastName;

  @BuiltValueField(wireName: 'job_title')
  String? get jobTitle;

  @BuiltValueField(wireName: 'profile_image')
  String? get profileImage;

  @BuiltValueField(wireName: 'company_name')
  String? get companyName;

  @BuiltValueField(wireName: 'mobile_phone')
  String? get mobilePhone;

  @BuiltValueField(wireName: 'direct_line')
  String? get directLine;

  @BuiltValueField(wireName: 'fax_number')
  String? get faxNumber;

  @BuiltValueField(wireName: 'email_address')
  String? get emailAddress;

  String? get bio;

  String? get country;

  @BuiltValueField(wireName: 'main_colour')
  Color? get mainColour;

  @BuiltValueField(wireName: 'secondary_colour')
  Color? get secondaryColour;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PreCreatedProfilesRecordBuilder builder) =>
      builder
        ..linkedInUrl = ''
        ..firstName = ''
        ..lastName = ''
        ..jobTitle = ''
        ..profileImage = ''
        ..companyName = ''
        ..mobilePhone = ''
        ..directLine = ''
        ..faxNumber = ''
        ..emailAddress = ''
        ..bio = ''
        ..country = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pre_created_profiles');

  static Stream<PreCreatedProfilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PreCreatedProfilesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PreCreatedProfilesRecord._();
  factory PreCreatedProfilesRecord(
          [void Function(PreCreatedProfilesRecordBuilder) updates]) =
      _$PreCreatedProfilesRecord;

  static PreCreatedProfilesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPreCreatedProfilesRecordData({
  String? linkedInUrl,
  String? firstName,
  String? lastName,
  String? jobTitle,
  String? profileImage,
  String? companyName,
  String? mobilePhone,
  String? directLine,
  String? faxNumber,
  String? emailAddress,
  String? bio,
  String? country,
  Color? mainColour,
  Color? secondaryColour,
}) {
  final firestoreData = serializers.toFirestore(
    PreCreatedProfilesRecord.serializer,
    PreCreatedProfilesRecord(
      (p) => p
        ..linkedInUrl = linkedInUrl
        ..firstName = firstName
        ..lastName = lastName
        ..jobTitle = jobTitle
        ..profileImage = profileImage
        ..companyName = companyName
        ..mobilePhone = mobilePhone
        ..directLine = directLine
        ..faxNumber = faxNumber
        ..emailAddress = emailAddress
        ..bio = bio
        ..country = country
        ..mainColour = mainColour
        ..secondaryColour = secondaryColour,
    ),
  );

  return firestoreData;
}
