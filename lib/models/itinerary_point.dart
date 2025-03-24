// lib/models/itinerary_point.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'spot.dart';

part 'itinerary_point.freezed.dart';
part 'itinerary_point.g.dart';

@freezed
class ItineraryPoint with _$ItineraryPoint {
  const factory ItineraryPoint({
    required Spot spot,
    @Default(false) bool isHotel,
  }) = _ItineraryPoint;

  factory ItineraryPoint.fromJson(Map<String, dynamic> json) =>
      _$ItineraryPointFromJson(json);
}
