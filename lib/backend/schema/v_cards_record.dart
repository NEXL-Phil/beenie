import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'v_cards_record.g.dart';

abstract class VCardsRecord
    implements Built<VCardsRecord, VCardsRecordBuilder> {
  static Serializer<VCardsRecord> get serializer => _$vCardsRecordSerializer;

  DocumentReference? get owner;

  String? get vCardUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(VCardsRecordBuilder builder) =>
      builder..vCardUrl = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('vCards')
          : FirebaseFirestore.instance.collectionGroup('vCards');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('vCards').doc();

  static Stream<VCardsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VCardsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  VCardsRecord._();
  factory VCardsRecord([void Function(VCardsRecordBuilder) updates]) =
      _$VCardsRecord;

  static VCardsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVCardsRecordData({
  DocumentReference? owner,
  String? vCardUrl,
}) {
  final firestoreData = serializers.toFirestore(
    VCardsRecord.serializer,
    VCardsRecord(
      (v) => v
        ..owner = owner
        ..vCardUrl = vCardUrl,
    ),
  );

  return firestoreData;
}
