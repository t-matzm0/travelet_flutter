class Spot {
  final String id;
  final String name;
  final String address;
  final String? category;
  final List<String>? tags;
  final String? officialUrl;
  final String? placeId;
  final List<String> photos;
  final String? comment;
  final int likes;
  final int bookmarkCount;
  final bool bookmarkedByMe;
  final bool likedByMe;

  Spot({
    required this.id,
    required this.name,
    required this.address,
    this.category,
    this.tags,
    this.officialUrl,
    this.placeId,
    this.photos = const [],
    this.comment,
    this.likes = 0,
    this.bookmarkCount = 0,
    this.bookmarkedByMe = false,
    this.likedByMe = false,
  });

  factory Spot.fromMap(String id, Map<String, dynamic> data) {
    return Spot(
      id: id,
      name: data['name'] ?? '',
      address: data['address'] ?? '',
      category: data['category'],
      tags: List<String>.from(data['tags'] ?? []),
      officialUrl: data['officialUrl'],
      placeId: data['placeId'],
      photos: List<String>.from(data['photos'] ?? []),
      comment: data['comment'],
      likes: data['likes'] ?? 0,
      bookmarkCount: data['bookmarkCount'] ?? 0,
      bookmarkedByMe: data['bookmarkedByMe'] ?? false,
      likedByMe: data['likedByMe'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'category': category,
      'tags': tags ?? [],
      'officialUrl': officialUrl,
      'placeId': placeId,
      'photos': photos,
      'comment': comment,
      'likes': likes,
      'bookmarkCount': bookmarkCount,
      'bookmarkedByMe': bookmarkedByMe,
      'likedByMe': likedByMe,
    };
  }

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
    int? bookmarkCount,
    bool? bookmarkedByMe,
    bool? likedByMe,
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
      bookmarkCount: bookmarkCount ?? this.bookmarkCount,
      bookmarkedByMe: bookmarkedByMe ?? this.bookmarkedByMe,
      likedByMe: likedByMe ?? this.likedByMe,
    );
  }
}
