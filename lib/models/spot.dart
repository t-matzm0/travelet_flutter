// lib/models/spot.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot.freezed.dart';
part 'spot.g.dart';

@freezed
class Spot with _$Spot {
  const factory Spot({
    required String id,
    required String name,
    required String address,
    required String category,
    required List<String> tags,
    required String officialUrl,
    required String placeId,
    required List<String> photos,
    required String comment,
    required int likes,
    required bool likedByMe,
    required int bookmarkCount,
    required bool bookmarkedByMe,
    int? estimatedDurationMinutes,
  }) = _Spot;

  factory Spot.fromJson(Map<String, dynamic> json) => _$SpotFromJson(json);

  factory Spot.fromForm({
    required String name,
    required String address,
    required String category,
    required List<String> tags,
    required String officialUrl,
    required String placeId,
    required List<String> photos,
    required String comment,
  }) {
    return Spot(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      address: address,
      category: category,
      tags: tags,
      officialUrl: officialUrl,
      placeId: placeId,
      photos: photos,
      comment: comment,
      likes: 0,
      likedByMe: false,
      bookmarkCount: 0,
      bookmarkedByMe: false,
    );
  }
}
