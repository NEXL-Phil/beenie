// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiles_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfilesRecord> _$profilesRecordSerializer =
    new _$ProfilesRecordSerializer();

class _$ProfilesRecordSerializer
    implements StructuredSerializer<ProfilesRecord> {
  @override
  final Iterable<Type> types = const [ProfilesRecord, _$ProfilesRecord];
  @override
  final String wireName = 'ProfilesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProfilesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(AddressStruct)),
    ];
    Object? value;
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.modifiedAt;
    if (value != null) {
      result
        ..add('modified_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.archived;
    if (value != null) {
      result
        ..add('archived')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.defaultAddress;
    if (value != null) {
      result
        ..add('default_address')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
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
    value = object.companyLogo;
    if (value != null) {
      result
        ..add('company_logo')
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
    value = object.publicProfileId;
    if (value != null) {
      result
        ..add('public_profile_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.domain;
    if (value != null) {
      result
        ..add('domain')
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
    value = object.vCardRef;
    if (value != null) {
      result
        ..add('vCardRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.linkedBeenieCard;
    if (value != null) {
      result
        ..add('linkedBeenieCard')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  ProfilesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfilesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'address':
          result.address.replace(serializers.deserialize(value,
              specifiedType: const FullType(AddressStruct))! as AddressStruct);
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'modified_at':
          result.modifiedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'archived':
          result.archived = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'default_address':
          result.defaultAddress = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
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
        case 'company_logo':
          result.companyLogo = serializers.deserialize(value,
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
        case 'public_profile_id':
          result.publicProfileId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'domain':
          result.domain = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vCardRef':
          result.vCardRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'linkedBeenieCard':
          result.linkedBeenieCard = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$ProfilesRecord extends ProfilesRecord {
  @override
  final AddressStruct address;
  @override
  final DocumentReference<Object?>? owner;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? modifiedAt;
  @override
  final bool? archived;
  @override
  final bool? defaultAddress;
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
  final String? companyLogo;
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
  final String? publicProfileId;
  @override
  final String? domain;
  @override
  final String? country;
  @override
  final DocumentReference<Object?>? vCardRef;
  @override
  final DocumentReference<Object?>? linkedBeenieCard;
  @override
  final Color? mainColour;
  @override
  final Color? secondaryColour;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProfilesRecord([void Function(ProfilesRecordBuilder)? updates]) =>
      (new ProfilesRecordBuilder()..update(updates))._build();

  _$ProfilesRecord._(
      {required this.address,
      this.owner,
      this.createdAt,
      this.modifiedAt,
      this.archived,
      this.defaultAddress,
      this.linkedInUrl,
      this.firstName,
      this.lastName,
      this.jobTitle,
      this.profileImage,
      this.companyName,
      this.companyLogo,
      this.mobilePhone,
      this.directLine,
      this.faxNumber,
      this.emailAddress,
      this.bio,
      this.publicProfileId,
      this.domain,
      this.country,
      this.vCardRef,
      this.linkedBeenieCard,
      this.mainColour,
      this.secondaryColour,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        address, r'ProfilesRecord', 'address');
  }

  @override
  ProfilesRecord rebuild(void Function(ProfilesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfilesRecordBuilder toBuilder() =>
      new ProfilesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfilesRecord &&
        address == other.address &&
        owner == other.owner &&
        createdAt == other.createdAt &&
        modifiedAt == other.modifiedAt &&
        archived == other.archived &&
        defaultAddress == other.defaultAddress &&
        linkedInUrl == other.linkedInUrl &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        jobTitle == other.jobTitle &&
        profileImage == other.profileImage &&
        companyName == other.companyName &&
        companyLogo == other.companyLogo &&
        mobilePhone == other.mobilePhone &&
        directLine == other.directLine &&
        faxNumber == other.faxNumber &&
        emailAddress == other.emailAddress &&
        bio == other.bio &&
        publicProfileId == other.publicProfileId &&
        domain == other.domain &&
        country == other.country &&
        vCardRef == other.vCardRef &&
        linkedBeenieCard == other.linkedBeenieCard &&
        mainColour == other.mainColour &&
        secondaryColour == other.secondaryColour &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, owner.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, modifiedAt.hashCode);
    _$hash = $jc(_$hash, archived.hashCode);
    _$hash = $jc(_$hash, defaultAddress.hashCode);
    _$hash = $jc(_$hash, linkedInUrl.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, jobTitle.hashCode);
    _$hash = $jc(_$hash, profileImage.hashCode);
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, companyLogo.hashCode);
    _$hash = $jc(_$hash, mobilePhone.hashCode);
    _$hash = $jc(_$hash, directLine.hashCode);
    _$hash = $jc(_$hash, faxNumber.hashCode);
    _$hash = $jc(_$hash, emailAddress.hashCode);
    _$hash = $jc(_$hash, bio.hashCode);
    _$hash = $jc(_$hash, publicProfileId.hashCode);
    _$hash = $jc(_$hash, domain.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, vCardRef.hashCode);
    _$hash = $jc(_$hash, linkedBeenieCard.hashCode);
    _$hash = $jc(_$hash, mainColour.hashCode);
    _$hash = $jc(_$hash, secondaryColour.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfilesRecord')
          ..add('address', address)
          ..add('owner', owner)
          ..add('createdAt', createdAt)
          ..add('modifiedAt', modifiedAt)
          ..add('archived', archived)
          ..add('defaultAddress', defaultAddress)
          ..add('linkedInUrl', linkedInUrl)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('jobTitle', jobTitle)
          ..add('profileImage', profileImage)
          ..add('companyName', companyName)
          ..add('companyLogo', companyLogo)
          ..add('mobilePhone', mobilePhone)
          ..add('directLine', directLine)
          ..add('faxNumber', faxNumber)
          ..add('emailAddress', emailAddress)
          ..add('bio', bio)
          ..add('publicProfileId', publicProfileId)
          ..add('domain', domain)
          ..add('country', country)
          ..add('vCardRef', vCardRef)
          ..add('linkedBeenieCard', linkedBeenieCard)
          ..add('mainColour', mainColour)
          ..add('secondaryColour', secondaryColour)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProfilesRecordBuilder
    implements Builder<ProfilesRecord, ProfilesRecordBuilder> {
  _$ProfilesRecord? _$v;

  AddressStructBuilder? _address;
  AddressStructBuilder get address =>
      _$this._address ??= new AddressStructBuilder();
  set address(AddressStructBuilder? address) => _$this._address = address;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  bool? _archived;
  bool? get archived => _$this._archived;
  set archived(bool? archived) => _$this._archived = archived;

  bool? _defaultAddress;
  bool? get defaultAddress => _$this._defaultAddress;
  set defaultAddress(bool? defaultAddress) =>
      _$this._defaultAddress = defaultAddress;

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

  String? _companyLogo;
  String? get companyLogo => _$this._companyLogo;
  set companyLogo(String? companyLogo) => _$this._companyLogo = companyLogo;

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

  String? _publicProfileId;
  String? get publicProfileId => _$this._publicProfileId;
  set publicProfileId(String? publicProfileId) =>
      _$this._publicProfileId = publicProfileId;

  String? _domain;
  String? get domain => _$this._domain;
  set domain(String? domain) => _$this._domain = domain;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  DocumentReference<Object?>? _vCardRef;
  DocumentReference<Object?>? get vCardRef => _$this._vCardRef;
  set vCardRef(DocumentReference<Object?>? vCardRef) =>
      _$this._vCardRef = vCardRef;

  DocumentReference<Object?>? _linkedBeenieCard;
  DocumentReference<Object?>? get linkedBeenieCard => _$this._linkedBeenieCard;
  set linkedBeenieCard(DocumentReference<Object?>? linkedBeenieCard) =>
      _$this._linkedBeenieCard = linkedBeenieCard;

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

  ProfilesRecordBuilder() {
    ProfilesRecord._initializeBuilder(this);
  }

  ProfilesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address.toBuilder();
      _owner = $v.owner;
      _createdAt = $v.createdAt;
      _modifiedAt = $v.modifiedAt;
      _archived = $v.archived;
      _defaultAddress = $v.defaultAddress;
      _linkedInUrl = $v.linkedInUrl;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _jobTitle = $v.jobTitle;
      _profileImage = $v.profileImage;
      _companyName = $v.companyName;
      _companyLogo = $v.companyLogo;
      _mobilePhone = $v.mobilePhone;
      _directLine = $v.directLine;
      _faxNumber = $v.faxNumber;
      _emailAddress = $v.emailAddress;
      _bio = $v.bio;
      _publicProfileId = $v.publicProfileId;
      _domain = $v.domain;
      _country = $v.country;
      _vCardRef = $v.vCardRef;
      _linkedBeenieCard = $v.linkedBeenieCard;
      _mainColour = $v.mainColour;
      _secondaryColour = $v.secondaryColour;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfilesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfilesRecord;
  }

  @override
  void update(void Function(ProfilesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfilesRecord build() => _build();

  _$ProfilesRecord _build() {
    _$ProfilesRecord _$result;
    try {
      _$result = _$v ??
          new _$ProfilesRecord._(
              address: address.build(),
              owner: owner,
              createdAt: createdAt,
              modifiedAt: modifiedAt,
              archived: archived,
              defaultAddress: defaultAddress,
              linkedInUrl: linkedInUrl,
              firstName: firstName,
              lastName: lastName,
              jobTitle: jobTitle,
              profileImage: profileImage,
              companyName: companyName,
              companyLogo: companyLogo,
              mobilePhone: mobilePhone,
              directLine: directLine,
              faxNumber: faxNumber,
              emailAddress: emailAddress,
              bio: bio,
              publicProfileId: publicProfileId,
              domain: domain,
              country: country,
              vCardRef: vCardRef,
              linkedBeenieCard: linkedBeenieCard,
              mainColour: mainColour,
              secondaryColour: secondaryColour,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'address';
        address.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProfilesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
