// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itinerary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Itinerary _$ItineraryFromJson(Map<String, dynamic> json) {
  return _Itinerary.fromJson(json);
}

/// @nodoc
mixin _$Itinerary {
  List<ItineraryPoint> get points => throw _privateConstructorUsedError;
  List<ItinerarySegment> get segments => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  bool get likedByMe => throw _privateConstructorUsedError;
  int get bookmarkCount => throw _privateConstructorUsedError;
  bool get bookmarkedByMe => throw _privateConstructorUsedError;
  String? get representativeImageUrl => throw _privateConstructorUsedError;

  /// Serializes this Itinerary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Itinerary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItineraryCopyWith<Itinerary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItineraryCopyWith<$Res> {
  factory $ItineraryCopyWith(Itinerary value, $Res Function(Itinerary) then) =
      _$ItineraryCopyWithImpl<$Res, Itinerary>;
  @useResult
  $Res call(
      {List<ItineraryPoint> points,
      List<ItinerarySegment> segments,
      String title,
      String description,
      List<String> tags,
      bool isPublic,
      int likes,
      bool likedByMe,
      int bookmarkCount,
      bool bookmarkedByMe,
      String? representativeImageUrl});
}

/// @nodoc
class _$ItineraryCopyWithImpl<$Res, $Val extends Itinerary>
    implements $ItineraryCopyWith<$Res> {
  _$ItineraryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Itinerary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? segments = null,
    Object? title = null,
    Object? description = null,
    Object? tags = null,
    Object? isPublic = null,
    Object? likes = null,
    Object? likedByMe = null,
    Object? bookmarkCount = null,
    Object? bookmarkedByMe = null,
    Object? representativeImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<ItineraryPoint>,
      segments: null == segments
          ? _value.segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<ItinerarySegment>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      likedByMe: null == likedByMe
          ? _value.likedByMe
          : likedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      bookmarkCount: null == bookmarkCount
          ? _value.bookmarkCount
          : bookmarkCount // ignore: cast_nullable_to_non_nullable
              as int,
      bookmarkedByMe: null == bookmarkedByMe
          ? _value.bookmarkedByMe
          : bookmarkedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      representativeImageUrl: freezed == representativeImageUrl
          ? _value.representativeImageUrl
          : representativeImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItineraryImplCopyWith<$Res>
    implements $ItineraryCopyWith<$Res> {
  factory _$$ItineraryImplCopyWith(
          _$ItineraryImpl value, $Res Function(_$ItineraryImpl) then) =
      __$$ItineraryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ItineraryPoint> points,
      List<ItinerarySegment> segments,
      String title,
      String description,
      List<String> tags,
      bool isPublic,
      int likes,
      bool likedByMe,
      int bookmarkCount,
      bool bookmarkedByMe,
      String? representativeImageUrl});
}

/// @nodoc
class __$$ItineraryImplCopyWithImpl<$Res>
    extends _$ItineraryCopyWithImpl<$Res, _$ItineraryImpl>
    implements _$$ItineraryImplCopyWith<$Res> {
  __$$ItineraryImplCopyWithImpl(
      _$ItineraryImpl _value, $Res Function(_$ItineraryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Itinerary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? segments = null,
    Object? title = null,
    Object? description = null,
    Object? tags = null,
    Object? isPublic = null,
    Object? likes = null,
    Object? likedByMe = null,
    Object? bookmarkCount = null,
    Object? bookmarkedByMe = null,
    Object? representativeImageUrl = freezed,
  }) {
    return _then(_$ItineraryImpl(
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<ItineraryPoint>,
      segments: null == segments
          ? _value._segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<ItinerarySegment>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      likedByMe: null == likedByMe
          ? _value.likedByMe
          : likedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      bookmarkCount: null == bookmarkCount
          ? _value.bookmarkCount
          : bookmarkCount // ignore: cast_nullable_to_non_nullable
              as int,
      bookmarkedByMe: null == bookmarkedByMe
          ? _value.bookmarkedByMe
          : bookmarkedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      representativeImageUrl: freezed == representativeImageUrl
          ? _value.representativeImageUrl
          : representativeImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItineraryImpl implements _Itinerary {
  const _$ItineraryImpl(
      {required final List<ItineraryPoint> points,
      required final List<ItinerarySegment> segments,
      this.title = '',
      this.description = '',
      final List<String> tags = const [],
      this.isPublic = false,
      this.likes = 0,
      this.likedByMe = false,
      this.bookmarkCount = 0,
      this.bookmarkedByMe = false,
      this.representativeImageUrl})
      : _points = points,
        _segments = segments,
        _tags = tags;

  factory _$ItineraryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItineraryImplFromJson(json);

  final List<ItineraryPoint> _points;
  @override
  List<ItineraryPoint> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  final List<ItinerarySegment> _segments;
  @override
  List<ItinerarySegment> get segments {
    if (_segments is EqualUnmodifiableListView) return _segments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_segments);
  }

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final bool isPublic;
  @override
  @JsonKey()
  final int likes;
  @override
  @JsonKey()
  final bool likedByMe;
  @override
  @JsonKey()
  final int bookmarkCount;
  @override
  @JsonKey()
  final bool bookmarkedByMe;
  @override
  final String? representativeImageUrl;

  @override
  String toString() {
    return 'Itinerary(points: $points, segments: $segments, title: $title, description: $description, tags: $tags, isPublic: $isPublic, likes: $likes, likedByMe: $likedByMe, bookmarkCount: $bookmarkCount, bookmarkedByMe: $bookmarkedByMe, representativeImageUrl: $representativeImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItineraryImpl &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            const DeepCollectionEquality().equals(other._segments, _segments) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.likedByMe, likedByMe) ||
                other.likedByMe == likedByMe) &&
            (identical(other.bookmarkCount, bookmarkCount) ||
                other.bookmarkCount == bookmarkCount) &&
            (identical(other.bookmarkedByMe, bookmarkedByMe) ||
                other.bookmarkedByMe == bookmarkedByMe) &&
            (identical(other.representativeImageUrl, representativeImageUrl) ||
                other.representativeImageUrl == representativeImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_points),
      const DeepCollectionEquality().hash(_segments),
      title,
      description,
      const DeepCollectionEquality().hash(_tags),
      isPublic,
      likes,
      likedByMe,
      bookmarkCount,
      bookmarkedByMe,
      representativeImageUrl);

  /// Create a copy of Itinerary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItineraryImplCopyWith<_$ItineraryImpl> get copyWith =>
      __$$ItineraryImplCopyWithImpl<_$ItineraryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItineraryImplToJson(
      this,
    );
  }
}

abstract class _Itinerary implements Itinerary {
  const factory _Itinerary(
      {required final List<ItineraryPoint> points,
      required final List<ItinerarySegment> segments,
      final String title,
      final String description,
      final List<String> tags,
      final bool isPublic,
      final int likes,
      final bool likedByMe,
      final int bookmarkCount,
      final bool bookmarkedByMe,
      final String? representativeImageUrl}) = _$ItineraryImpl;

  factory _Itinerary.fromJson(Map<String, dynamic> json) =
      _$ItineraryImpl.fromJson;

  @override
  List<ItineraryPoint> get points;
  @override
  List<ItinerarySegment> get segments;
  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get tags;
  @override
  bool get isPublic;
  @override
  int get likes;
  @override
  bool get likedByMe;
  @override
  int get bookmarkCount;
  @override
  bool get bookmarkedByMe;
  @override
  String? get representativeImageUrl;

  /// Create a copy of Itinerary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItineraryImplCopyWith<_$ItineraryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
