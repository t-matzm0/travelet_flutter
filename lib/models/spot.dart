// lib/models/spot.dart
class Spot {
  final String id;
  final String name;
  final String address;
  final String category;
  final List<String> tags;
  final String officialUrl;
  final String placeId;
  final List<String> photos;
  final String comment;
  final int likes;
  final bool likedByMe;
  final int bookmarkCount;
  final bool bookmarkedByMe;

  const Spot({
    required this.id,
    required this.name,
    required this.address,
    required this.category,
    required this.tags,
    required this.officialUrl,
    required this.placeId,
    required this.photos,
    required this.comment,
    required this.likes,
    required this.likedByMe,
    required this.bookmarkCount,
    required this.bookmarkedByMe,
  });

  Spot copyWith({
    String? id,
    String? name,
    String? address,
    String? category,
    List<String>? tags,
    String? officialUrl,
    String? placeId,
    List<String>? photos,
    String? comment,
    int? likes,
    bool? likedByMe,
    int? bookmarkCount,
    bool? bookmarkedByMe,
  }) {
    return Spot(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      officialUrl: officialUrl ?? this.officialUrl,
      placeId: placeId ?? this.placeId,
      photos: photos ?? this.photos,
      comment: comment ?? this.comment,
      likes: likes ?? this.likes,
      likedByMe: likedByMe ?? this.likedByMe,
      bookmarkCount: bookmarkCount ?? this.bookmarkCount,
      bookmarkedByMe: bookmarkedByMe ?? this.bookmarkedByMe,
    );
  }

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
      id: DateTime.now().millisecondsSinceEpoch.toString(), // 仮ID（ユニーク性確保）
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