// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpotImpl _$$SpotImplFromJson(Map<String, dynamic> json) => _$SpotImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  category: json['category'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  officialUrl: json['officialUrl'] as String,
  placeId: json['placeId'] as String,
  photos: (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
  comment: json['comment'] as String,
  likes: (json['likes'] as num).toInt(),
  likedByMe: json['likedByMe'] as bool,
  bookmarkCount: (json['bookmarkCount'] as num).toInt(),
  bookmarkedByMe: json['bookmarkedByMe'] as bool,
  stayDurationMinutes: (json['stayDurationMinutes'] as num?)?.toInt(),
);

Map<String, dynamic> _$$SpotImplToJson(_$SpotImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'category': instance.category,
      'tags': instance.tags,
      'officialUrl': instance.officialUrl,
      'placeId': instance.placeId,
      'photos': instance.photos,
      'comment': instance.comment,
      'likes': instance.likes,
      'likedByMe': instance.likedByMe,
      'bookmarkCount': instance.bookmarkCount,
      'bookmarkedByMe': instance.bookmarkedByMe,
      'stayDurationMinutes': instance.stayDurationMinutes,
    };
