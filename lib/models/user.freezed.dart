// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  String get profileDescription => throw _privateConstructorUsedError;
  SocialLinks get socialLinks => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String displayName,
      String? photoURL,
      String profileDescription,
      SocialLinks socialLinks,
      DateTime? createdAt,
      DateTime? updatedAt});

  $SocialLinksCopyWith<$Res> get socialLinks;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = null,
    Object? photoURL = freezed,
    Object? profileDescription = null,
    Object? socialLinks = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      profileDescription: null == profileDescription
          ? _value.profileDescription
          : profileDescription // ignore: cast_nullable_to_non_nullable
              as String,
      socialLinks: null == socialLinks
          ? _value.socialLinks
          : socialLinks // ignore: cast_nullable_to_non_nullable
              as SocialLinks,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SocialLinksCopyWith<$Res> get socialLinks {
    return $SocialLinksCopyWith<$Res>(_value.socialLinks, (value) {
      return _then(_value.copyWith(socialLinks: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
          _$AppUserImpl value, $Res Function(_$AppUserImpl) then) =
      __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String displayName,
      String? photoURL,
      String profileDescription,
      SocialLinks socialLinks,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $SocialLinksCopyWith<$Res> get socialLinks;
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = null,
    Object? photoURL = freezed,
    Object? profileDescription = null,
    Object? socialLinks = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AppUserImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      profileDescription: null == profileDescription
          ? _value.profileDescription
          : profileDescription // ignore: cast_nullable_to_non_nullable
              as String,
      socialLinks: null == socialLinks
          ? _value.socialLinks
          : socialLinks // ignore: cast_nullable_to_non_nullable
              as SocialLinks,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserImpl implements _AppUser {
  const _$AppUserImpl(
      {required this.uid,
      required this.email,
      required this.displayName,
      this.photoURL,
      this.profileDescription = '',
      this.socialLinks = const SocialLinks(),
      this.createdAt,
      this.updatedAt});

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String? photoURL;
  @override
  @JsonKey()
  final String profileDescription;
  @override
  @JsonKey()
  final SocialLinks socialLinks;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'AppUser(uid: $uid, email: $email, displayName: $displayName, photoURL: $photoURL, profileDescription: $profileDescription, socialLinks: $socialLinks, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.profileDescription, profileDescription) ||
                other.profileDescription == profileDescription) &&
            (identical(other.socialLinks, socialLinks) ||
                other.socialLinks == socialLinks) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, email, displayName,
      photoURL, profileDescription, socialLinks, createdAt, updatedAt);

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserImplToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {required final String uid,
      required final String email,
      required final String displayName,
      final String? photoURL,
      final String profileDescription,
      final SocialLinks socialLinks,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$AppUserImpl;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  String get displayName;
  @override
  String? get photoURL;
  @override
  String get profileDescription;
  @override
  SocialLinks get socialLinks;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SocialLinks _$SocialLinksFromJson(Map<String, dynamic> json) {
  return _SocialLinks.fromJson(json);
}

/// @nodoc
mixin _$SocialLinks {
  String? get twitter => throw _privateConstructorUsedError;
  String? get instagram => throw _privateConstructorUsedError;
  String? get youtube => throw _privateConstructorUsedError;
  String? get vimeo => throw _privateConstructorUsedError;

  /// Serializes this SocialLinks to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialLinksCopyWith<SocialLinks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialLinksCopyWith<$Res> {
  factory $SocialLinksCopyWith(
          SocialLinks value, $Res Function(SocialLinks) then) =
      _$SocialLinksCopyWithImpl<$Res, SocialLinks>;
  @useResult
  $Res call(
      {String? twitter, String? instagram, String? youtube, String? vimeo});
}

/// @nodoc
class _$SocialLinksCopyWithImpl<$Res, $Val extends SocialLinks>
    implements $SocialLinksCopyWith<$Res> {
  _$SocialLinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialLinks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? twitter = freezed,
    Object? instagram = freezed,
    Object? youtube = freezed,
    Object? vimeo = freezed,
  }) {
    return _then(_value.copyWith(
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      youtube: freezed == youtube
          ? _value.youtube
          : youtube // ignore: cast_nullable_to_non_nullable
              as String?,
      vimeo: freezed == vimeo
          ? _value.vimeo
          : vimeo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialLinksImplCopyWith<$Res>
    implements $SocialLinksCopyWith<$Res> {
  factory _$$SocialLinksImplCopyWith(
          _$SocialLinksImpl value, $Res Function(_$SocialLinksImpl) then) =
      __$$SocialLinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? twitter, String? instagram, String? youtube, String? vimeo});
}

/// @nodoc
class __$$SocialLinksImplCopyWithImpl<$Res>
    extends _$SocialLinksCopyWithImpl<$Res, _$SocialLinksImpl>
    implements _$$SocialLinksImplCopyWith<$Res> {
  __$$SocialLinksImplCopyWithImpl(
      _$SocialLinksImpl _value, $Res Function(_$SocialLinksImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialLinks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? twitter = freezed,
    Object? instagram = freezed,
    Object? youtube = freezed,
    Object? vimeo = freezed,
  }) {
    return _then(_$SocialLinksImpl(
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      youtube: freezed == youtube
          ? _value.youtube
          : youtube // ignore: cast_nullable_to_non_nullable
              as String?,
      vimeo: freezed == vimeo
          ? _value.vimeo
          : vimeo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialLinksImpl implements _SocialLinks {
  const _$SocialLinksImpl(
      {this.twitter, this.instagram, this.youtube, this.vimeo});

  factory _$SocialLinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialLinksImplFromJson(json);

  @override
  final String? twitter;
  @override
  final String? instagram;
  @override
  final String? youtube;
  @override
  final String? vimeo;

  @override
  String toString() {
    return 'SocialLinks(twitter: $twitter, instagram: $instagram, youtube: $youtube, vimeo: $vimeo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialLinksImpl &&
            (identical(other.twitter, twitter) || other.twitter == twitter) &&
            (identical(other.instagram, instagram) ||
                other.instagram == instagram) &&
            (identical(other.youtube, youtube) || other.youtube == youtube) &&
            (identical(other.vimeo, vimeo) || other.vimeo == vimeo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, twitter, instagram, youtube, vimeo);

  /// Create a copy of SocialLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialLinksImplCopyWith<_$SocialLinksImpl> get copyWith =>
      __$$SocialLinksImplCopyWithImpl<_$SocialLinksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialLinksImplToJson(
      this,
    );
  }
}

abstract class _SocialLinks implements SocialLinks {
  const factory _SocialLinks(
      {final String? twitter,
      final String? instagram,
      final String? youtube,
      final String? vimeo}) = _$SocialLinksImpl;

  factory _SocialLinks.fromJson(Map<String, dynamic> json) =
      _$SocialLinksImpl.fromJson;

  @override
  String? get twitter;
  @override
  String? get instagram;
  @override
  String? get youtube;
  @override
  String? get vimeo;

  /// Create a copy of SocialLinks
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialLinksImplCopyWith<_$SocialLinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
