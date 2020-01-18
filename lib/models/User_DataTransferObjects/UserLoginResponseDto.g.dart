// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserLoginResponseDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginResponseDto _$UserLoginResponseDtoFromJson(Map<String, dynamic> json) {
  return UserLoginResponseDto()
    ..token = json['token'] as String
    ..tokenExpireDate = json['tokenExpireDate'] == null
        ? null
        : DateTime.parse(json['tokenExpireDate'] as String)
    ..username = json['username'] as String
    ..id = json['id'] as String;
}

Map<String, dynamic> _$UserLoginResponseDtoToJson(
        UserLoginResponseDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'tokenExpireDate': instance.tokenExpireDate?.toIso8601String(),
      'username': instance.username,
      'id': instance.id,
    };
