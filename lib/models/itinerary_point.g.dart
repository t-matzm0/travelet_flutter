// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItineraryPointImpl _$$ItineraryPointImplFromJson(Map<String, dynamic> json) =>
    _$ItineraryPointImpl(
      spot: Spot.fromJson(json['spot'] as Map<String, dynamic>),
      isHotel: json['isHotel'] as bool? ?? false,
    );

Map<String, dynamic> _$$ItineraryPointImplToJson(
        _$ItineraryPointImpl instance) =>
    <String, dynamic>{
      'spot': instance.spot.toJson(),
      'isHotel': instance.isHotel,
    };
