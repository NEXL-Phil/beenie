// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beeniecards_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BeeniecardsRecord> _$beeniecardsRecordSerializer =
    new _$BeeniecardsRecordSerializer();

class _$BeeniecardsRecordSerializer
    implements StructuredSerializer<BeeniecardsRecord> {
  @override
  final Iterable<Type> types = const [BeeniecardsRecord, _$BeeniecardsRecord];
  @override
  final String wireName = 'BeeniecardsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, BeeniecardsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.cardID;
    if (value != null) {
      result
        ..add('cardID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.linkedProfile;
    if (value != null) {
      result
        ..add('linkedProfile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.isActivated;
    if (value != null) {
      result
        ..add('isActivated')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  BeeniecardsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BeeniecardsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cardID':
          result.cardID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'linkedProfile':
          result.linkedProfile = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'isActivated':
          result.isActivated = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$BeeniecardsRecord extends BeeniecardsRecord {
  @override
  final String? cardID;
  @override
  final DocumentReference<Object?>? owner;
  @override
  final DocumentReference<Object?>? linkedProfile;
  @override
  final bool? isActivated;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BeeniecardsRecord(
          [void Function(BeeniecardsRecordBuilder)? updates]) =>
      (new BeeniecardsRecordBuilder()..update(updates))._build();

  _$BeeniecardsRecord._(
      {this.cardID,
      this.owner,
      this.linkedProfile,
      this.isActivated,
      this.ffRef})
      : super._();

  @override
  BeeniecardsRecord rebuild(void Function(BeeniecardsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BeeniecardsRecordBuilder toBuilder() =>
      new BeeniecardsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BeeniecardsRecord &&
        cardID == other.cardID &&
        owner == other.owner &&
        linkedProfile == other.linkedProfile &&
        isActivated == other.isActivated &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, cardID.hashCode), owner.hashCode),
                linkedProfile.hashCode),
            isActivated.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BeeniecardsRecord')
          ..add('cardID', cardID)
          ..add('owner', owner)
          ..add('linkedProfile', linkedProfile)
          ..add('isActivated', isActivated)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BeeniecardsRecordBuilder
    implements Builder<BeeniecardsRecord, BeeniecardsRecordBuilder> {
  _$BeeniecardsRecord? _$v;

  String? _cardID;
  String? get cardID => _$this._cardID;
  set cardID(String? cardID) => _$this._cardID = cardID;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  DocumentReference<Object?>? _linkedProfile;
  DocumentReference<Object?>? get linkedProfile => _$this._linkedProfile;
  set linkedProfile(DocumentReference<Object?>? linkedProfile) =>
      _$this._linkedProfile = linkedProfile;

  bool? _isActivated;
  bool? get isActivated => _$this._isActivated;
  set isActivated(bool? isActivated) => _$this._isActivated = isActivated;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BeeniecardsRecordBuilder() {
    BeeniecardsRecord._initializeBuilder(this);
  }

  BeeniecardsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cardID = $v.cardID;
      _owner = $v.owner;
      _linkedProfile = $v.linkedProfile;
      _isActivated = $v.isActivated;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BeeniecardsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BeeniecardsRecord;
  }

  @override
  void update(void Function(BeeniecardsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BeeniecardsRecord build() => _build();

  _$BeeniecardsRecord _build() {
    final _$result = _$v ??
        new _$BeeniecardsRecord._(
            cardID: cardID,
            owner: owner,
            linkedProfile: linkedProfile,
            isActivated: isActivated,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
