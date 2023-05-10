import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'public_branding_record.g.dart';

abstract class PublicBrandingRecord
    implements Built<PublicBrandingRecord, PublicBrandingRecordBuilder> {
  static Serializer<PublicBrandingRecord> get serializer =>
      _$publicBrandingRecordSerializer;

  @BuiltValueField(wireName: 'company_logo')
  String? get companyLogo;

  @BuiltValueField(wireName: 'brand_color')
  Color? get brandColor;

  @BuiltValueField(wireName: 'company_name')
  String? get companyName;

  @BuiltValueField(wireName: 'company_domain')
  String? get companyDomain;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PublicBrandingRecordBuilder builder) => builder
    ..companyLogo = ''
    ..companyName = ''
    ..companyDomain = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('public_branding');

  static Stream<PublicBrandingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PublicBrandingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PublicBrandingRecord._();
  factory PublicBrandingRecord(
          [void Function(PublicBrandingRecordBuilder) updates]) =
      _$PublicBrandingRecord;

  static PublicBrandingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPublicBrandingRecordData({
  String? companyLogo,
  Color? brandColor,
  String? companyName,
  String? companyDomain,
}) {
  final firestoreData = serializers.toFirestore(
    PublicBrandingRecord.serializer,
    PublicBrandingRecord(
      (p) => p
        ..companyLogo = companyLogo
        ..brandColor = brandColor
        ..companyName = companyName
        ..companyDomain = companyDomain,
    ),
  );

  return firestoreData;
}
