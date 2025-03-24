// lib/models/itinerary_segment.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'transport_mode.dart';

part 'itinerary_segment.freezed.dart';
part 'itinerary_segment.g.dart';

@freezed
class ItinerarySegment with _$ItinerarySegment {
  const factory ItinerarySegment({
    required TransportMode mode,
    @Default('') String note,
    @Default(0) int durationMinutes, // 移動時間（分）
    @Default('') String memo, // メモ
  }) = _ItinerarySegment;

  factory ItinerarySegment.fromJson(Map<String, dynamic> json) =>
      _$ItinerarySegmentFromJson(json);
}
