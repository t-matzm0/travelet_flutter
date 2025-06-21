import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    required String email,
    required String displayName,
    String? photoURL,
    @Default('') String profileDescription,
    @Default(SocialLinks()) SocialLinks socialLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
}

@freezed
class SocialLinks with _$SocialLinks {
  const factory SocialLinks({
    String? twitter,
    String? instagram,
    String? youtube,
    String? vimeo,
  }) = _SocialLinks;

  factory SocialLinks.fromJson(Map<String, dynamic> json) => _$SocialLinksFromJson(json);
}