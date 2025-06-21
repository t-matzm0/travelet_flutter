// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      photoURL: json['photoURL'] as String?,
      profileDescription: json['profileDescription'] as String? ?? '',
      socialLinks: json['socialLinks'] == null
          ? const SocialLinks()
          : SocialLinks.fromJson(json['socialLinks'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'profileDescription': instance.profileDescription,
      'socialLinks': instance.socialLinks,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$SocialLinksImpl _$$SocialLinksImplFromJson(Map<String, dynamic> json) =>
    _$SocialLinksImpl(
      twitter: json['twitter'] as String?,
      instagram: json['instagram'] as String?,
      youtube: json['youtube'] as String?,
      vimeo: json['vimeo'] as String?,
    );

Map<String, dynamic> _$$SocialLinksImplToJson(_$SocialLinksImpl instance) =>
    <String, dynamic>{
      'twitter': instance.twitter,
      'instagram': instance.instagram,
      'youtube': instance.youtube,
      'vimeo': instance.vimeo,
    };
