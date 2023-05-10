// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_created_profiles_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PreCreatedProfilesRecord> _$preCreatedProfilesRecordSerializer =
    new _$PreCreatedProfilesRecordSerializer();

class _$PreCreatedProfilesRecordSerializer
    implements StructuredSerializer<PreCreatedProfilesRecord> {
  @override
  final Iterable<Type> types = const [
    PreCreatedProfilesRecord,
    _$PreCreatedProfilesRecord
  ];
  @override
  final String wireName = 'PreCreatedProfilesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PreCreatedProfilesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.linkedInUrl;
    if (value != null) {
      result
        ..add('linkedIn_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobTitle;
    if (value != null) {
      result
        ..add('job_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.profileImage;
    if (value != null) {
      result
        ..add('profile_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.companyName;
    if (value != null) {
      result
        ..add('company_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mobilePhone;
    if (value != null) {
      result
        ..add('mobile_phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.directLine;
    if (value != null) {
      result
        ..add('direct_line')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.faxNumber;
    if (value != null) {
      result
        ..add('fax_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.emailAddress;
    if (value != null) {
      result
        ..add('email_address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mainColour;
    if (value != null) {
      result
        ..add('main_colour')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Color)));
    }
    value = object.secondaryColour;
    if (value != null) {
      result
        ..add('secondary_colour')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Color)));
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
  PreCreatedProfilesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PreCreatedProfilesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'linkedIn_url':
          result.linkedInUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'job_title':
          result.jobTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'profile_image':
          result.profileImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mobile_phone':
          result.mobilePhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'direct_line':
          result.directLine = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fax_number':
          result.faxNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email_address':
          result.emailAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'main_colour':
          result.mainColour = serializers.deserialize(value,
              specifiedType: const FullType(Color)) as Color?;
          break;
        case 'secondary_colour':
          result.secondaryColour = serializers.deserialize(value,
              specifiedType: const FullType(Color)) as Color?;
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

class _$PreCreatedProfilesRecord extends PreCreatedProfilesRecord {
  @override
  final String? linkedInUrl;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? jobTitle;
  @override
  final String? profileImage;
  @override
  final String? companyName;
  @override
  final String? mobilePhone;
  @override
  final String? directLine;
  @override
  final String? faxNumber;
  @override
  final String? emailAddress;
  @override
  final String? bio;
  @override
  final String? country;
  @override
  final Color? mainColour;
  @override
  final Color? secondaryColour;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PreCreatedProfilesRecord(
          [void Function(PreCreatedProfilesRecordBuilder)? updates]) =>
      (new PreCreatedProfilesRecordBuilder()..update(updates))._build();

  _$PreCreatedProfilesRecord._(
      {this.linkedInUrl,
      this.firstName,
      this.lastName,
      this.jobTitle,
      this.profileImage,
      this.companyName,
      this.mobilePhone,
      this.directLine,
      this.faxNumber,
      this.emailAddress,
      this.bio,
      this.country,
      this.mainColour,
      this.secondaryColour,
      this.ffRef})
      : super._();

  @override
  PreCreatedProfilesRecord rebuild(
          void Function(PreCreatedProfilesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PreCreatedProfilesRecordBuilder toBuilder() =>
      new PreCreatedProfilesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PreCreatedProfilesRecord &&
        linkedInUrl == other.linkedInUrl &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        jobTitle == other.jobTitle &&
        profileImage == other.profileImage &&
        companyName == other.companyName &&
        mobilePhone == other.mobilePhone &&
        directLine == other.directLine &&
        faxNumber == other.faxNumber &&
        emailAddress == other.emailAddress &&
        bio == other.bio &&
        country == other.country &&
        mainColour == other.mainColour &&
        secondaryColour == other.secondaryColour &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, linkedInUrl.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, jobTitle.hashCode);
    _$hash = $jc(_$hash, profileImage.hashCode);
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, mobilePhone.hashCode);
    _$hash = $jc(_$hash, directLine.hashCode);
    _$hash = $jc(_$hash, faxNumber.hashCode);
    _$hash = $jc(_$hash, emailAddress.hashCode);
    _$hash = $jc(_$hash, bio.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, mainColour.hashCode);
    _$hash = $jc(_$hash, secondaryColour.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PreCreatedProfilesRecord')
          ..add('linkedInUrl', linkedInUrl)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('jobTitle', jobTitle)
          ..add('profileImage', profileImage)
          ..add('companyName', companyName)
          ..add('mobilePhone', mobilePhone)
          ..add('directLine', directLine)
          ..add('faxNumber', faxNumber)
          ..add('emailAddress', emailAddress)
          ..add('bio', bio)
          ..add('country', country)
          ..add('mainColour', mainColour)
          ..add('secondaryColour', secondaryColour)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PreCreatedProfilesRecordBuilder
    implements
        Builder<PreCreatedProfilesRecord, PreCreatedProfilesRecordBuilder> {
  _$PreCreatedProfilesRecord? _$v;

  String? _linkedInUrl;
  String? get linkedInUrl => _$this._linkedInUrl;
  set linkedInUrl(String? linkedInUrl) => _$this._linkedInUrl = linkedInUrl;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _jobTitle;
  String? get jobTitle => _$this._jobTitle;
  set jobTitle(String? jobTitle) => _$this._jobTitle = jobTitle;

  String? _profileImage;
  String? get profileImage => _$this._profileImage;
  set profileImage(String? profileImage) => _$this._profileImage = profileImage;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  String? _mobilePhone;
  String? get mobilePhone => _$this._mobilePhone;
  set mobilePhone(String? mobilePhone) => _$this._mobilePhone = mobilePhone;

  String? _directLine;
  String? get directLine => _$this._directLine;
  set directLine(String? directLine) => _$this._directLine = directLine;

  String? _faxNumber;
  String? get faxNumber => _$this._faxNumber;
  set faxNumber(String? faxNumber) => _$this._faxNumber = faxNumber;

  String? _emailAddress;
  String? get emailAddress => _$this._emailAddress;
  set emailAddress(String? emailAddress) => _$this._emailAddress = emailAddress;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  Color? _mainColour;
  Color? get mainColour => _$this._mainColour;
  set mainColour(Color? mainColour) => _$this._mainColour = mainColour;

  Color? _secondaryColour;
  Color? get secondaryColour => _$this._secondaryColour;
  set secondaryColour(Color? secondaryColour) =>
      _$this._secondaryColour = secondaryColour;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PreCreatedProfilesRecordBuilder() {
    PreCreatedProfilesRecord._initializeBuilder(this);
  }

  PreCreatedProfilesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _linkedInUrl = $v.linkedInUrl;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _jobTitle = $v.jobTitle;
      _profileImage = $v.profileImage;
      _companyName = $v.companyName;
      _mobilePhone = $v.mobilePhone;
      _directLine = $v.directLine;
      _faxNumber = $v.faxNumber;
      _emailAddress = $v.emailAddress;
      _bio = $v.bio;
      _country = $v.country;
      _mainColour = $v.mainColour;
      _secondaryColour = $v.secondaryColour;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PreCreatedProfilesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PreCreatedProfilesRecord;
  }

  @override
  void update(void Function(PreCreatedProfilesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PreCreatedProfilesRecord build() => _build();

  _$PreCreatedProfilesRecord _build() {
    final _$result = _$v ??
        new _$PreCreatedProfilesRecord._(
            linkedInUrl: linkedInUrl,
            firstName: firstName,
            lastName: lastName,
            jobTitle: jobTitle,
            profileImage: profileImage,
            companyName: companyName,
            mobilePhone: mobilePhone,
            directLine: directLine,
            faxNumber: faxNumber,
            emailAddress: emailAddress,
            bio: bio,
            country: country,
            mainColour: mainColour,
            secondaryColour: secondaryColour,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
