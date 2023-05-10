import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'profiles_record.g.dart';

abstract class ProfilesRecord
    implements Built<ProfilesRecord, ProfilesRecordBuilder> {
  static Serializer<ProfilesRecord> get serializer =>
      _$profilesRecordSerializer;

  AddressStruct get address;

  DocumentReference? get owner;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'modified_at')
  DateTime? get modifiedAt;

  bool? get archived;

  @BuiltValueField(wireName: 'default_address')
  bool? get defaultAddress;

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

  @BuiltValueField(wireName: 'company_logo')
  String? get companyLogo;

  @BuiltValueField(wireName: 'mobile_phone')
  String? get mobilePhone;

  @BuiltValueField(wireName: 'direct_line')
  String? get directLine;

  @BuiltValueField(wireName: 'fax_number')
  String? get faxNumber;

  @BuiltValueField(wireName: 'email_address')
  String? get emailAddress;

  String? get bio;

  @BuiltValueField(wireName: 'public_profile_id')
  String? get publicProfileId;

  String? get domain;

  String? get country;

  DocumentReference? get vCardRef;

  DocumentReference? get linkedBeenieCard;

  @BuiltValueField(wireName: 'main_colour')
  Color? get mainColour;

  @BuiltValueField(wireName: 'secondary_colour')
  Color? get secondaryColour;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProfilesRecordBuilder builder) => builder
    ..address = AddressStructBuilder()
    ..archived = false
    ..defaultAddress = false
    ..linkedInUrl = ''
    ..firstName = ''
    ..lastName = ''
    ..jobTitle = ''
    ..profileImage = ''
    ..companyName = ''
    ..companyLogo = ''
    ..mobilePhone = ''
    ..directLine = ''
    ..faxNumber = ''
    ..emailAddress = ''
    ..bio = ''
    ..publicProfileId = ''
    ..domain = ''
    ..country = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profiles');

  static Stream<ProfilesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProfilesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProfilesRecord._();
  factory ProfilesRecord([void Function(ProfilesRecordBuilder) updates]) =
      _$ProfilesRecord;

  static ProfilesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProfilesRecordData({
  AddressStruct? address,
  DocumentReference? owner,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? archived,
  bool? defaultAddress,
  String? linkedInUrl,
  String? firstName,
  String? lastName,
  String? jobTitle,
  String? profileImage,
  String? companyName,
  String? companyLogo,
  String? mobilePhone,
  String? directLine,
  String? faxNumber,
  String? emailAddress,
  String? bio,
  String? publicProfileId,
  String? domain,
  String? country,
  DocumentReference? vCardRef,
  DocumentReference? linkedBeenieCard,
  Color? mainColour,
  Color? secondaryColour,
}) {
  final firestoreData = serializers.toFirestore(
    ProfilesRecord.serializer,
    ProfilesRecord(
      (p) => p
        ..address = AddressStructBuilder()
        ..owner = owner
        ..createdAt = createdAt
        ..modifiedAt = modifiedAt
        ..archived = archived
        ..defaultAddress = defaultAddress
        ..linkedInUrl = linkedInUrl
        ..firstName = firstName
        ..lastName = lastName
        ..jobTitle = jobTitle
        ..profileImage = profileImage
        ..companyName = companyName
        ..companyLogo = companyLogo
        ..mobilePhone = mobilePhone
        ..directLine = directLine
        ..faxNumber = faxNumber
        ..emailAddress = emailAddress
        ..bio = bio
        ..publicProfileId = publicProfileId
        ..domain = domain
        ..country = country
        ..vCardRef = vCardRef
        ..linkedBeenieCard = linkedBeenieCard
        ..mainColour = mainColour
        ..secondaryColour = secondaryColour,
    ),
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  return firestoreData;
}
