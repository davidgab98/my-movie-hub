// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'iso_639_1') String? iso6391,
    @JsonKey(name: 'iso_3166_1') String? iso31661,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'include_adult') @Default(false) bool includeAdult,
    @JsonKey(name: 'avatar') Avatar? avatar,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Avatar with _$Avatar {
  const factory Avatar({
    @JsonKey(name: 'gravatar', fromJson: _gravatarHashFromJson)
    String? gravatarHash,
    @JsonKey(name: 'tmdb', fromJson: _avatarImagePathFromJson)
    String? avatarImagePath,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}

String? _gravatarHashFromJson(Map<String, dynamic>? json) {
  return json?['hash'] as String?;
}

String? _avatarImagePathFromJson(Map<String, dynamic>? json) {
  return json?['avatar_path'] as String?;
}
