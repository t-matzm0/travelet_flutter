// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itinerary_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ItineraryPoint _$ItineraryPointFromJson(Map<String, dynamic> json) {
  return _ItineraryPoint.fromJson(json);
}

/// @nodoc
mixin _$ItineraryPoint {
  Spot get spot => throw _privateConstructorUsedError;
  bool get isHotel => throw _privateConstructorUsedError;
  int? get estimatedDurationMinutes => throw _privateConstructorUsedError;

  /// Serializes this ItineraryPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItineraryPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItineraryPointCopyWith<ItineraryPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItineraryPointCopyWith<$Res> {
  factory $ItineraryPointCopyWith(
    ItineraryPoint value,
    $Res Function(ItineraryPoint) then,
  ) = _$ItineraryPointCopyWithImpl<$Res, ItineraryPoint>;
  @useResult
  $Res call({Spot spot, bool isHotel, int? estimatedDurationMinutes});

  $SpotCopyWith<$Res> get spot;
}

/// @nodoc
class _$ItineraryPointCopyWithImpl<$Res, $Val extends ItineraryPoint>
    implements $ItineraryPointCopyWith<$Res> {
  _$ItineraryPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItineraryPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spot = null,
    Object? isHotel = null,
    Object? estimatedDurationMinutes = freezed,
  }) {
    return _then(
      _value.copyWith(
            spot:
                null == spot
                    ? _value.spot
                    : spot // ignore: cast_nullable_to_non_nullable
                        as Spot,
            isHotel:
                null == isHotel
                    ? _value.isHotel
                    : isHotel // ignore: cast_nullable_to_non_nullable
                        as bool,
            estimatedDurationMinutes:
                freezed == estimatedDurationMinutes
                    ? _value.estimatedDurationMinutes
                    : estimatedDurationMinutes // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of ItineraryPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpotCopyWith<$Res> get spot {
    return $SpotCopyWith<$Res>(_value.spot, (value) {
      return _then(_value.copyWith(spot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItineraryPointImplCopyWith<$Res>
    implements $ItineraryPointCopyWith<$Res> {
  factory _$$ItineraryPointImplCopyWith(
    _$ItineraryPointImpl value,
    $Res Function(_$ItineraryPointImpl) then,
  ) = __$$ItineraryPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Spot spot, bool isHotel, int? estimatedDurationMinutes});

  @override
  $SpotCopyWith<$Res> get spot;
}

/// @nodoc
class __$$ItineraryPointImplCopyWithImpl<$Res>
    extends _$ItineraryPointCopyWithImpl<$Res, _$ItineraryPointImpl>
    implements _$$ItineraryPointImplCopyWith<$Res> {
  __$$ItineraryPointImplCopyWithImpl(
    _$ItineraryPointImpl _value,
    $Res Function(_$ItineraryPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItineraryPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spot = null,
    Object? isHotel = null,
    Object? estimatedDurationMinutes = freezed,
  }) {
    return _then(
      _$ItineraryPointImpl(
        spot:
            null == spot
                ? _value.spot
                : spot // ignore: cast_nullable_to_non_nullable
                    as Spot,
        isHotel:
            null == isHotel
                ? _value.isHotel
                : isHotel // ignore: cast_nullable_to_non_nullable
                    as bool,
        estimatedDurationMinutes:
            freezed == estimatedDurationMinutes
                ? _value.estimatedDurationMinutes
                : estimatedDurationMinutes // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ItineraryPointImpl implements _ItineraryPoint {
  const _$ItineraryPointImpl({
    required this.spot,
    this.isHotel = false,
    this.estimatedDurationMinutes,
  });

  factory _$ItineraryPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItineraryPointImplFromJson(json);

  @override
  final Spot spot;
  @override
  @JsonKey()
  final bool isHotel;
  @override
  final int? estimatedDurationMinutes;

  @override
  String toString() {
    return 'ItineraryPoint(spot: $spot, isHotel: $isHotel, estimatedDurationMinutes: $estimatedDurationMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItineraryPointImpl &&
            (identical(other.spot, spot) || other.spot == spot) &&
            (identical(other.isHotel, isHotel) || other.isHotel == isHotel) &&
            (identical(
                  other.estimatedDurationMinutes,
                  estimatedDurationMinutes,
                ) ||
                other.estimatedDurationMinutes == estimatedDurationMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, spot, isHotel, estimatedDurationMinutes);

  /// Create a copy of ItineraryPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItineraryPointImplCopyWith<_$ItineraryPointImpl> get copyWith =>
      __$$ItineraryPointImplCopyWithImpl<_$ItineraryPointImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ItineraryPointImplToJson(this);
  }
}

abstract class _ItineraryPoint implements ItineraryPoint {
  const factory _ItineraryPoint({
    required final Spot spot,
    final bool isHotel,
    final int? estimatedDurationMinutes,
  }) = _$ItineraryPointImpl;

  factory _ItineraryPoint.fromJson(Map<String, dynamic> json) =
      _$ItineraryPointImpl.fromJson;

  @override
  Spot get spot;
  @override
  bool get isHotel;
  @override
  int? get estimatedDurationMinutes;

  /// Create a copy of ItineraryPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItineraryPointImplCopyWith<_$ItineraryPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
