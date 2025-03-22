class Spot {
  final String id;
  final String name;
  final String address;
  final String? category;
  final List<String>? tags;
  final String? officialUrl;
  final List<String> photos;
  final String? comment;
  final int likes;
  final bool likedByMe;
  final int bookmarkCount;
  final bool bookmarkedByMe;

  Spot({
    required this.id,
    required this.name,
    required this.address,
    this.category,
    this.tags,
    this.officialUrl,
    this.photos = const [],
    this.comment,
    this.likes = 0,
    this.likedByMe = false,
    this.bookmarkCount = 0,
    this.bookmarkedByMe = false,
  });

  factory Spot.fromMap(String id, Map<String, dynamic> data) {
    return Spot(
      id: id,
      name: data['name'] ?? '',
      address: data['address'] ?? '',
      category: data['category'],
      tags: List<String>.from(data['tags'] ?? []),
      officialUrl: data['officialUrl'],
      photos: List<String>.from(data['photos'] ?? []),
      comment: data['comment'],
      likes: data['likes'] ?? 0,
      bookmarkCount: data['bookmarkCount'] ?? 0,
      bookmarkedByMe: data['bookmarkedByMe'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'category': category,
      'tags': tags ?? [],
      'officialUrl': officialUrl,
      'photos': photos,
      'comment': comment,
      'likes': likes,
      'bookmarkCount': bookmarkCount,
      'bookmarkedByMe': bookmarkedByMe,
    };
  }

  Spot copyWith({
    String? id,
    String? name,
    String? address,
    String? category,
    List<String>? tags,
    String? officialUrl,
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
      photos: photos ?? this.photos,
      comment: comment ?? this.comment,
      likes: likes ?? this.likes,
      bookmarkCount: bookmarkCount ?? this.bookmarkCount,
      bookmarkedByMe: bookmarkedByMe ?? this.bookmarkedByMe,
      likedByMe: likedByMe ?? this.likedByMe,
    );
  }
}
