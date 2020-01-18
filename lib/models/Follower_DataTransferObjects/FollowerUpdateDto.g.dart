// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FollowerUpdateDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowerUpdateDto _$FollowerUpdateDtoFromJson(Map<String, dynamic> json) {
  return FollowerUpdateDto()
    ..followerId = json['followerId'] as String
    ..user1Id = json['user1Id'] as String
    ..user2Id = json['user2Id'] as String
    ..friendshipDate = json['friendshipDate'] == null
        ? null
        : DateTime.parse(json['friendshipDate'] as String)
    ..isAccepted = json['isAccepted'] as bool
    ..isActive = json['isActive'] as bool;
}

Map<String, dynamic> _$FollowerUpdateDtoToJson(FollowerUpdateDto instance) =>
    <String, dynamic>{
      'followerId': instance.followerId,
      'user1Id': instance.user1Id,
      'user2Id': instance.user2Id,
      'friendshipDate': instance.friendshipDate?.toIso8601String(),
      'isAccepted': instance.isAccepted,
      'isActive': instance.isActive,
    };
