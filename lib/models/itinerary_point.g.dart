// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItineraryPointImpl _$$ItineraryPointImplFromJson(Map<String, dynamic> json) =>
    _$ItineraryPointImpl(
      spot: Spot.fromJson(json['spot'] as Map<String, dynamic>),
      isHotel: json['isHotel'] as bool? ?? false,
      estimatedDurationMinutes:
          (json['estimatedDurationMinutes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ItineraryPointImplToJson(
  _$ItineraryPointImpl instance,
) => <String, dynamic>{
  'spot': instance.spot,
  'isHotel': instance.isHotel,
  'estimatedDurationMinutes': instance.estimatedDurationMinutes,
};
