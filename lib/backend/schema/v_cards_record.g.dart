// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v_cards_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VCardsRecord> _$vCardsRecordSerializer =
    new _$VCardsRecordSerializer();

class _$VCardsRecordSerializer implements StructuredSerializer<VCardsRecord> {
  @override
  final Iterable<Type> types = const [VCardsRecord, _$VCardsRecord];
  @override
  final String wireName = 'VCardsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, VCardsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.vCardUrl;
    if (value != null) {
      result
        ..add('vCardUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  VCardsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VCardsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'vCardUrl':
          result.vCardUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$VCardsRecord extends VCardsRecord {
  @override
  final DocumentReference<Object?>? owner;
  @override
  final String? vCardUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VCardsRecord([void Function(VCardsRecordBuilder)? updates]) =>
      (new VCardsRecordBuilder()..update(updates))._build();

  _$VCardsRecord._({this.owner, this.vCardUrl, this.ffRef}) : super._();

  @override
  VCardsRecord rebuild(void Function(VCardsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VCardsRecordBuilder toBuilder() => new VCardsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VCardsRecord &&
        owner == other.owner &&
        vCardUrl == other.vCardUrl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, owner.hashCode);
    _$hash = $jc(_$hash, vCardUrl.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VCardsRecord')
          ..add('owner', owner)
          ..add('vCardUrl', vCardUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VCardsRecordBuilder
    implements Builder<VCardsRecord, VCardsRecordBuilder> {
  _$VCardsRecord? _$v;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  String? _vCardUrl;
  String? get vCardUrl => _$this._vCardUrl;
  set vCardUrl(String? vCardUrl) => _$this._vCardUrl = vCardUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VCardsRecordBuilder() {
    VCardsRecord._initializeBuilder(this);
  }

  VCardsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _owner = $v.owner;
      _vCardUrl = $v.vCardUrl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VCardsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VCardsRecord;
  }

  @override
  void update(void Function(VCardsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VCardsRecord build() => _build();

  _$VCardsRecord _build() {
    final _$result = _$v ??
        new _$VCardsRecord._(owner: owner, vCardUrl: vCardUrl, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
