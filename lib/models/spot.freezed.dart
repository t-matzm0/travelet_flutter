// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Spot _$SpotFromJson(Map<String, dynamic> json) {
  return _Spot.fromJson(json);
}

/// @nodoc
mixin _$Spot {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get officialUrl => throw _privateConstructorUsedError;
  String get placeId => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  bool get likedByMe => throw _privateConstructorUsedError;
  int get bookmarkCount => throw _privateConstructorUsedError;
  bool get bookmarkedByMe => throw _privateConstructorUsedError;
  int? get stayDurationMinutes => throw _privateConstructorUsedError;

  /// Serializes this Spot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Spot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpotCopyWith<Spot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotCopyWith<$Res> {
  factory $SpotCopyWith(Spot value, $Res Function(Spot) then) =
      _$SpotCopyWithImpl<$Res, Spot>;
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    String category,
    List<String> tags,
    String officialUrl,
    String placeId,
    List<String> photos,
    String comment,
    int likes,
    bool likedByMe,
    int bookmarkCount,
    bool bookmarkedByMe,
    int? stayDurationMinutes,
  });
}

/// @nodoc
class _$SpotCopyWithImpl<$Res, $Val extends Spot>
    implements $SpotCopyWith<$Res> {
  _$SpotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Spot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? category = null,
    Object? tags = null,
    Object? officialUrl = null,
    Object? placeId = null,
    Object? photos = null,
    Object? comment = null,
    Object? likes = null,
    Object? likedByMe = null,
    Object? bookmarkCount = null,
    Object? bookmarkedByMe = null,
    Object? stayDurationMinutes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            address:
                null == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as String,
            tags:
                null == tags
                    ? _value.tags
                    : tags // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            officialUrl:
                null == officialUrl
                    ? _value.officialUrl
                    : officialUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            placeId:
                null == placeId
                    ? _value.placeId
                    : placeId // ignore: cast_nullable_to_non_nullable
                        as String,
            photos:
                null == photos
                    ? _value.photos
                    : photos // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            comment:
                null == comment
                    ? _value.comment
                    : comment // ignore: cast_nullable_to_non_nullable
                        as String,
            likes:
                null == likes
                    ? _value.likes
                    : likes // ignore: cast_nullable_to_non_nullable
                        as int,
            likedByMe:
                null == likedByMe
                    ? _value.likedByMe
                    : likedByMe // ignore: cast_nullable_to_non_nullable
                        as bool,
            bookmarkCount:
                null == bookmarkCount
                    ? _value.bookmarkCount
                    : bookmarkCount // ignore: cast_nullable_to_non_nullable
                        as int,
            bookmarkedByMe:
                null == bookmarkedByMe
                    ? _value.bookmarkedByMe
                    : bookmarkedByMe // ignore: cast_nullable_to_non_nullable
                        as bool,
            stayDurationMinutes:
                freezed == stayDurationMinutes
                    ? _value.stayDurationMinutes
                    : stayDurationMinutes // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpotImplCopyWith<$Res> implements $SpotCopyWith<$Res> {
  factory _$$SpotImplCopyWith(
    _$SpotImpl value,
    $Res Function(_$SpotImpl) then,
  ) = __$$SpotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    String category,
    List<String> tags,
    String officialUrl,
    String placeId,
    List<String> photos,
    String comment,
    int likes,
    bool likedByMe,
    int bookmarkCount,
    bool bookmarkedByMe,
    int? stayDurationMinutes,
  });
}

/// @nodoc
class __$$SpotImplCopyWithImpl<$Res>
    extends _$SpotCopyWithImpl<$Res, _$SpotImpl>
    implements _$$SpotImplCopyWith<$Res> {
  __$$SpotImplCopyWithImpl(_$SpotImpl _value, $Res Function(_$SpotImpl) _then)
    : super(_value, _then);

  /// Create a copy of Spot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? category = null,
    Object? tags = null,
    Object? officialUrl = null,
    Object? placeId = null,
    Object? photos = null,
    Object? comment = null,
    Object? likes = null,
    Object? likedByMe = null,
    Object? bookmarkCount = null,
    Object? bookmarkedByMe = null,
    Object? stayDurationMinutes = freezed,
  }) {
    return _then(
      _$SpotImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as String,
        tags:
            null == tags
                ? _value._tags
                : tags // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        officialUrl:
            null == officialUrl
                ? _value.officialUrl
                : officialUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        placeId:
            null == placeId
                ? _value.placeId
                : placeId // ignore: cast_nullable_to_non_nullable
                    as String,
        photos:
            null == photos
                ? _value._photos
                : photos // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        comment:
            null == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                    as String,
        likes:
            null == likes
                ? _value.likes
                : likes // ignore: cast_nullable_to_non_nullable
                    as int,
        likedByMe:
            null == likedByMe
                ? _value.likedByMe
                : likedByMe // ignore: cast_nullable_to_non_nullable
                    as bool,
        bookmarkCount:
            null == bookmarkCount
                ? _value.bookmarkCount
                : bookmarkCount // ignore: cast_nullable_to_non_nullable
                    as int,
        bookmarkedByMe:
            null == bookmarkedByMe
                ? _value.bookmarkedByMe
                : bookmarkedByMe // ignore: cast_nullable_to_non_nullable
                    as bool,
        stayDurationMinutes:
            freezed == stayDurationMinutes
                ? _value.stayDurationMinutes
                : stayDurationMinutes // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpotImpl implements _Spot {
  const _$SpotImpl({
    required this.id,
    required this.name,
    required this.address,
    required this.category,
    required final List<String> tags,
    required this.officialUrl,
    required this.placeId,
    required final List<String> photos,
    required this.comment,
    required this.likes,
    required this.likedByMe,
    required this.bookmarkCount,
    required this.bookmarkedByMe,
    this.stayDurationMinutes,
  }) : _tags = tags,
       _photos = photos;

  factory _$SpotImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpotImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  final String category;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String officialUrl;
  @override
  final String placeId;
  final List<String> _photos;
  @override
  List<String> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  final String comment;
  @override
  final int likes;
  @override
  final bool likedByMe;
  @override
  final int bookmarkCount;
  @override
  final bool bookmarkedByMe;
  @override
  final int? stayDurationMinutes;

  @override
  String toString() {
    return 'Spot(id: $id, name: $name, address: $address, category: $category, tags: $tags, officialUrl: $officialUrl, placeId: $placeId, photos: $photos, comment: $comment, likes: $likes, likedByMe: $likedByMe, bookmarkCount: $bookmarkCount, bookmarkedByMe: $bookmarkedByMe, stayDurationMinutes: $stayDurationMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.officialUrl, officialUrl) ||
                other.officialUrl == officialUrl) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.likedByMe, likedByMe) ||
                other.likedByMe == likedByMe) &&
            (identical(other.bookmarkCount, bookmarkCount) ||
                other.bookmarkCount == bookmarkCount) &&
            (identical(other.bookmarkedByMe, bookmarkedByMe) ||
                other.bookmarkedByMe == bookmarkedByMe) &&
            (identical(other.stayDurationMinutes, stayDurationMinutes) ||
                other.stayDurationMinutes == stayDurationMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    address,
    category,
    const DeepCollectionEquality().hash(_tags),
    officialUrl,
    placeId,
    const DeepCollectionEquality().hash(_photos),
    comment,
    likes,
    likedByMe,
    bookmarkCount,
    bookmarkedByMe,
    stayDurationMinutes,
  );

  /// Create a copy of Spot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpotImplCopyWith<_$SpotImpl> get copyWith =>
      __$$SpotImplCopyWithImpl<_$SpotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpotImplToJson(this);
  }
}

abstract class _Spot implements Spot {
  const factory _Spot({
    required final String id,
    required final String name,
    required final String address,
    required final String category,
    required final List<String> tags,
    required final String officialUrl,
    required final String placeId,
    required final List<String> photos,
    required final String comment,
    required final int likes,
    required final bool likedByMe,
    required final int bookmarkCount,
    required final bool bookmarkedByMe,
    final int? stayDurationMinutes,
  }) = _$SpotImpl;

  factory _Spot.fromJson(Map<String, dynamic> json) = _$SpotImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String get category;
  @override
  List<String> get tags;
  @override
  String get officialUrl;
  @override
  String get placeId;
  @override
  List<String> get photos;
  @override
  String get comment;
  @override
  int get likes;
  @override
  bool get likedByMe;
  @override
  int get bookmarkCount;
  @override
  bool get bookmarkedByMe;
  @override
  int? get stayDurationMinutes;

  /// Create a copy of Spot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpotImplCopyWith<_$SpotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
