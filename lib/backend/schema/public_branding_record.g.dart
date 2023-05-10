// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_branding_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PublicBrandingRecord> _$publicBrandingRecordSerializer =
    new _$PublicBrandingRecordSerializer();

class _$PublicBrandingRecordSerializer
    implements StructuredSerializer<PublicBrandingRecord> {
  @override
  final Iterable<Type> types = const [
    PublicBrandingRecord,
    _$PublicBrandingRecord
  ];
  @override
  final String wireName = 'PublicBrandingRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PublicBrandingRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.companyLogo;
    if (value != null) {
      result
        ..add('company_logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.brandColor;
    if (value != null) {
      result
        ..add('brand_color')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Color)));
    }
    value = object.companyName;
    if (value != null) {
      result
        ..add('company_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.companyDomain;
    if (value != null) {
      result
        ..add('company_domain')
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
  PublicBrandingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PublicBrandingRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'company_logo':
          result.companyLogo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'brand_color':
          result.brandColor = serializers.deserialize(value,
              specifiedType: const FullType(Color)) as Color?;
          break;
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_domain':
          result.companyDomain = serializers.deserialize(value,
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

class _$PublicBrandingRecord extends PublicBrandingRecord {
  @override
  final String? companyLogo;
  @override
  final Color? brandColor;
  @override
  final String? companyName;
  @override
  final String? companyDomain;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PublicBrandingRecord(
          [void Function(PublicBrandingRecordBuilder)? updates]) =>
      (new PublicBrandingRecordBuilder()..update(updates))._build();

  _$PublicBrandingRecord._(
      {this.companyLogo,
      this.brandColor,
      this.companyName,
      this.companyDomain,
      this.ffRef})
      : super._();

  @override
  PublicBrandingRecord rebuild(
          void Function(PublicBrandingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicBrandingRecordBuilder toBuilder() =>
      new PublicBrandingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicBrandingRecord &&
        companyLogo == other.companyLogo &&
        brandColor == other.brandColor &&
        companyName == other.companyName &&
        companyDomain == other.companyDomain &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, companyLogo.hashCode);
    _$hash = $jc(_$hash, brandColor.hashCode);
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, companyDomain.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PublicBrandingRecord')
          ..add('companyLogo', companyLogo)
          ..add('brandColor', brandColor)
          ..add('companyName', companyName)
          ..add('companyDomain', companyDomain)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PublicBrandingRecordBuilder
    implements Builder<PublicBrandingRecord, PublicBrandingRecordBuilder> {
  _$PublicBrandingRecord? _$v;

  String? _companyLogo;
  String? get companyLogo => _$this._companyLogo;
  set companyLogo(String? companyLogo) => _$this._companyLogo = companyLogo;

  Color? _brandColor;
  Color? get brandColor => _$this._brandColor;
  set brandColor(Color? brandColor) => _$this._brandColor = brandColor;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  String? _companyDomain;
  String? get companyDomain => _$this._companyDomain;
  set companyDomain(String? companyDomain) =>
      _$this._companyDomain = companyDomain;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PublicBrandingRecordBuilder() {
    PublicBrandingRecord._initializeBuilder(this);
  }

  PublicBrandingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _companyLogo = $v.companyLogo;
      _brandColor = $v.brandColor;
      _companyName = $v.companyName;
      _companyDomain = $v.companyDomain;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublicBrandingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PublicBrandingRecord;
  }

  @override
  void update(void Function(PublicBrandingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicBrandingRecord build() => _build();

  _$PublicBrandingRecord _build() {
    final _$result = _$v ??
        new _$PublicBrandingRecord._(
            companyLogo: companyLogo,
            brandColor: brandColor,
            companyName: companyName,
            companyDomain: companyDomain,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
