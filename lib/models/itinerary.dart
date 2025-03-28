import 'package:freezed_annotation/freezed_annotation.dart';
import 'itinerary_point.dart';
import 'itinerary_segment.dart';

part 'itinerary.freezed.dart';
part 'itinerary.g.dart';

@freezed
class Itinerary with _$Itinerary {
  const factory Itinerary({
    required List<ItineraryPoint> points,
    required List<ItinerarySegment> segments,
    @Default('') String title,
    @Default('') String description,
    @Default([]) List<String> tags,
    @Default(false) bool isPublic,
    @Default(0) int likes,
    @Default(false) bool likedByMe,
    @Default(0) int bookmarkCount,
    @Default(false) bool bookmarkedByMe,
    String? representativeImageUrl, // ★代表画像URLを追加
  }) = _Itinerary;

  factory Itinerary.fromJson(Map<String, dynamic> json) =>
      _$ItineraryFromJson(json);
}
