// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itinerary_segment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ItinerarySegment _$ItinerarySegmentFromJson(Map<String, dynamic> json) {
  return _ItinerarySegment.fromJson(json);
}

/// @nodoc
mixin _$ItinerarySegment {
  TransportMode get mode => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError; // 移動時間（分）
  String get memo => throw _privateConstructorUsedError;

  /// Serializes this ItinerarySegment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItinerarySegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItinerarySegmentCopyWith<ItinerarySegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItinerarySegmentCopyWith<$Res> {
  factory $ItinerarySegmentCopyWith(
    ItinerarySegment value,
    $Res Function(ItinerarySegment) then,
  ) = _$ItinerarySegmentCopyWithImpl<$Res, ItinerarySegment>;
  @useResult
  $Res call({
    TransportMode mode,
    String note,
    int durationMinutes,
    String memo,
  });
}

/// @nodoc
class _$ItinerarySegmentCopyWithImpl<$Res, $Val extends ItinerarySegment>
    implements $ItinerarySegmentCopyWith<$Res> {
  _$ItinerarySegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItinerarySegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? note = null,
    Object? durationMinutes = null,
    Object? memo = null,
  }) {
    return _then(
      _value.copyWith(
            mode:
                null == mode
                    ? _value.mode
                    : mode // ignore: cast_nullable_to_non_nullable
                        as TransportMode,
            note:
                null == note
                    ? _value.note
                    : note // ignore: cast_nullable_to_non_nullable
                        as String,
            durationMinutes:
                null == durationMinutes
                    ? _value.durationMinutes
                    : durationMinutes // ignore: cast_nullable_to_non_nullable
                        as int,
            memo:
                null == memo
                    ? _value.memo
                    : memo // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ItinerarySegmentImplCopyWith<$Res>
    implements $ItinerarySegmentCopyWith<$Res> {
  factory _$$ItinerarySegmentImplCopyWith(
    _$ItinerarySegmentImpl value,
    $Res Function(_$ItinerarySegmentImpl) then,
  ) = __$$ItinerarySegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TransportMode mode,
    String note,
    int durationMinutes,
    String memo,
  });
}

/// @nodoc
class __$$ItinerarySegmentImplCopyWithImpl<$Res>
    extends _$ItinerarySegmentCopyWithImpl<$Res, _$ItinerarySegmentImpl>
    implements _$$ItinerarySegmentImplCopyWith<$Res> {
  __$$ItinerarySegmentImplCopyWithImpl(
    _$ItinerarySegmentImpl _value,
    $Res Function(_$ItinerarySegmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItinerarySegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? note = null,
    Object? durationMinutes = null,
    Object? memo = null,
  }) {
    return _then(
      _$ItinerarySegmentImpl(
        mode:
            null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                    as TransportMode,
        note:
            null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                    as String,
        durationMinutes:
            null == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                    as int,
        memo:
            null == memo
                ? _value.memo
                : memo // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ItinerarySegmentImpl implements _ItinerarySegment {
  const _$ItinerarySegmentImpl({
    required this.mode,
    this.note = '',
    this.durationMinutes = 0,
    this.memo = '',
  });

  factory _$ItinerarySegmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItinerarySegmentImplFromJson(json);

  @override
  final TransportMode mode;
  @override
  @JsonKey()
  final String note;
  @override
  @JsonKey()
  final int durationMinutes;
  // 移動時間（分）
  @override
  @JsonKey()
  final String memo;

  @override
  String toString() {
    return 'ItinerarySegment(mode: $mode, note: $note, durationMinutes: $durationMinutes, memo: $memo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItinerarySegmentImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mode, note, durationMinutes, memo);

  /// Create a copy of ItinerarySegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItinerarySegmentImplCopyWith<_$ItinerarySegmentImpl> get copyWith =>
      __$$ItinerarySegmentImplCopyWithImpl<_$ItinerarySegmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ItinerarySegmentImplToJson(this);
  }
}

abstract class _ItinerarySegment implements ItinerarySegment {
  const factory _ItinerarySegment({
    required final TransportMode mode,
    final String note,
    final int durationMinutes,
    final String memo,
  }) = _$ItinerarySegmentImpl;

  factory _ItinerarySegment.fromJson(Map<String, dynamic> json) =
      _$ItinerarySegmentImpl.fromJson;

  @override
  TransportMode get mode;
  @override
  String get note;
  @override
  int get durationMinutes; // 移動時間（分）
  @override
  String get memo;

  /// Create a copy of ItinerarySegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItinerarySegmentImplCopyWith<_$ItinerarySegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
