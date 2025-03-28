// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItineraryImpl _$$ItineraryImplFromJson(Map<String, dynamic> json) =>
    _$ItineraryImpl(
      points:
          (json['points'] as List<dynamic>)
              .map((e) => ItineraryPoint.fromJson(e as Map<String, dynamic>))
              .toList(),
      segments:
          (json['segments'] as List<dynamic>)
              .map((e) => ItinerarySegment.fromJson(e as Map<String, dynamic>))
              .toList(),
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      isPublic: json['isPublic'] as bool? ?? false,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      likedByMe: json['likedByMe'] as bool? ?? false,
      bookmarkCount: (json['bookmarkCount'] as num?)?.toInt() ?? 0,
      bookmarkedByMe: json['bookmarkedByMe'] as bool? ?? false,
      representativeImageUrl: json['representativeImageUrl'] as String?,
    );

Map<String, dynamic> _$$ItineraryImplToJson(_$ItineraryImpl instance) =>
    <String, dynamic>{
      'points': instance.points,
      'segments': instance.segments,
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'isPublic': instance.isPublic,
      'likes': instance.likes,
      'likedByMe': instance.likedByMe,
      'bookmarkCount': instance.bookmarkCount,
      'bookmarkedByMe': instance.bookmarkedByMe,
      'representativeImageUrl': instance.representativeImageUrl,
    };
