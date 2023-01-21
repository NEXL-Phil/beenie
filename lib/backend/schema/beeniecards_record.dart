import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'beeniecards_record.g.dart';

abstract class BeeniecardsRecord
    implements Built<BeeniecardsRecord, BeeniecardsRecordBuilder> {
  static Serializer<BeeniecardsRecord> get serializer =>
      _$beeniecardsRecordSerializer;

  String? get cardID;

  DocumentReference? get owner;

  DocumentReference? get linkedProfile;

  bool? get isActivated;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BeeniecardsRecordBuilder builder) => builder
    ..cardID = ''
    ..isActivated = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('beeniecards');

  static Stream<BeeniecardsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BeeniecardsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BeeniecardsRecord._();
  factory BeeniecardsRecord([void Function(BeeniecardsRecordBuilder) updates]) =
      _$BeeniecardsRecord;

  static BeeniecardsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBeeniecardsRecordData({
  String? cardID,
  DocumentReference? owner,
  DocumentReference? linkedProfile,
  bool? isActivated,
}) {
  final firestoreData = serializers.toFirestore(
    BeeniecardsRecord.serializer,
    BeeniecardsRecord(
      (b) => b
        ..cardID = cardID
        ..owner = owner
        ..linkedProfile = linkedProfile
        ..isActivated = isActivated,
    ),
  );

  return firestoreData;
}
