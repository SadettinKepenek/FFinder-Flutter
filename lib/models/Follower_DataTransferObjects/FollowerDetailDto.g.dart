// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FollowerDetailDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowerDetailDto _$FollowerDetailDtoFromJson(Map<String, dynamic> json) {
  return FollowerDetailDto()
    ..followerId = json['followerId'] as String
    ..user1Id = json['user1Id'] as String
    ..user2Id = json['user2Id'] as String
    ..friendshipDate = json['friendshipDate'] == null
        ? null
        : DateTime.parse(json['friendshipDate'] as String)
    ..isAccepted = json['isAccepted'] as bool
    ..isActive = json['isActive'] as bool;
}

Map<String, dynamic> _$FollowerDetailDtoToJson(FollowerDetailDto instance) =>
    <String, dynamic>{
      'followerId': instance.followerId,
      'user1Id': instance.user1Id,
      'user2Id': instance.user2Id,
      'friendshipDate': instance.friendshipDate?.toIso8601String(),
      'isAccepted': instance.isAccepted,
      'isActive': instance.isActive,
    };
