// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContactsRecord> _$contactsRecordSerializer =
    new _$ContactsRecordSerializer();

class _$ContactsRecordSerializer
    implements StructuredSerializer<ContactsRecord> {
  @override
  final Iterable<Type> types = const [ContactsRecord, _$ContactsRecord];
  @override
  final String wireName = 'ContactsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ContactsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.emailAddress;
    if (value != null) {
      result
        ..add('email_address')
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
    value = object.jobTitle;
    if (value != null) {
      result
        ..add('job_title')
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
    value = object.linkedInUrl;
    if (value != null) {
      result
        ..add('linkedIn_url')
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
    value = object.contactImage;
    if (value != null) {
      result
        ..add('contact_image')
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
  ContactsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email_address':
          result.emailAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mobile_phone':
          result.mobilePhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'job_title':
          result.jobTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'linkedIn_url':
          result.linkedInUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'contact_image':
          result.contactImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_logo':
          result.companyLogo = serializers.deserialize(value,
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

class _$ContactsRecord extends ContactsRecord {
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? emailAddress;
  @override
  final String? mobilePhone;
  @override
  final String? jobTitle;
  @override
  final String? companyName;
  @override
  final String? linkedInUrl;
  @override
  final String? bio;
  @override
  final String? contactImage;
  @override
  final String? companyLogo;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ContactsRecord([void Function(ContactsRecordBuilder)? updates]) =>
      (new ContactsRecordBuilder()..update(updates))._build();

  _$ContactsRecord._(
      {this.firstName,
      this.lastName,
      this.emailAddress,
      this.mobilePhone,
      this.jobTitle,
      this.companyName,
      this.linkedInUrl,
      this.bio,
      this.contactImage,
      this.companyLogo,
      this.ffRef})
      : super._();

  @override
  ContactsRecord rebuild(void Function(ContactsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactsRecordBuilder toBuilder() =>
      new ContactsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactsRecord &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        emailAddress == other.emailAddress &&
        mobilePhone == other.mobilePhone &&
        jobTitle == other.jobTitle &&
        companyName == other.companyName &&
        linkedInUrl == other.linkedInUrl &&
        bio == other.bio &&
        contactImage == other.contactImage &&
        companyLogo == other.companyLogo &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, firstName.hashCode),
                                            lastName.hashCode),
                                        emailAddress.hashCode),
                                    mobilePhone.hashCode),
                                jobTitle.hashCode),
                            companyName.hashCode),
                        linkedInUrl.hashCode),
                    bio.hashCode),
                contactImage.hashCode),
            companyLogo.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContactsRecord')
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('emailAddress', emailAddress)
          ..add('mobilePhone', mobilePhone)
          ..add('jobTitle', jobTitle)
          ..add('companyName', companyName)
          ..add('linkedInUrl', linkedInUrl)
          ..add('bio', bio)
          ..add('contactImage', contactImage)
          ..add('companyLogo', companyLogo)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ContactsRecordBuilder
    implements Builder<ContactsRecord, ContactsRecordBuilder> {
  _$ContactsRecord? _$v;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _emailAddress;
  String? get emailAddress => _$this._emailAddress;
  set emailAddress(String? emailAddress) => _$this._emailAddress = emailAddress;

  String? _mobilePhone;
  String? get mobilePhone => _$this._mobilePhone;
  set mobilePhone(String? mobilePhone) => _$this._mobilePhone = mobilePhone;

  String? _jobTitle;
  String? get jobTitle => _$this._jobTitle;
  set jobTitle(String? jobTitle) => _$this._jobTitle = jobTitle;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  String? _linkedInUrl;
  String? get linkedInUrl => _$this._linkedInUrl;
  set linkedInUrl(String? linkedInUrl) => _$this._linkedInUrl = linkedInUrl;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _contactImage;
  String? get contactImage => _$this._contactImage;
  set contactImage(String? contactImage) => _$this._contactImage = contactImage;

  String? _companyLogo;
  String? get companyLogo => _$this._companyLogo;
  set companyLogo(String? companyLogo) => _$this._companyLogo = companyLogo;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ContactsRecordBuilder() {
    ContactsRecord._initializeBuilder(this);
  }

  ContactsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _emailAddress = $v.emailAddress;
      _mobilePhone = $v.mobilePhone;
      _jobTitle = $v.jobTitle;
      _companyName = $v.companyName;
      _linkedInUrl = $v.linkedInUrl;
      _bio = $v.bio;
      _contactImage = $v.contactImage;
      _companyLogo = $v.companyLogo;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactsRecord;
  }

  @override
  void update(void Function(ContactsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactsRecord build() => _build();

  _$ContactsRecord _build() {
    final _$result = _$v ??
        new _$ContactsRecord._(
            firstName: firstName,
            lastName: lastName,
            emailAddress: emailAddress,
            mobilePhone: mobilePhone,
            jobTitle: jobTitle,
            companyName: companyName,
            linkedInUrl: linkedInUrl,
            bio: bio,
            contactImage: contactImage,
            companyLogo: companyLogo,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
