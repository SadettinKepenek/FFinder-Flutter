// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FollowerListDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowerListDto _$FollowerListDtoFromJson(Map<String, dynamic> json) {
  return FollowerListDto()
    ..followerId = json['followerId'] as String
    ..user1Id = json['user1Id'] as String
    ..user2Id = json['user2Id'] as String
    ..friendshipDate = json['friendshipDate'] == null
        ? null
        : DateTime.parse(json['friendshipDate'] as String)
    ..isAccepted = json['isAccepted'] as bool
    ..isActive = json['isActive'] as bool
    ..user1UserName = json['user1UserName'] as String
    ..user1Firstname = json['user1Firstname'] as String
    ..user1Lastname = json['user1Lastname'] as String
    ..user1Email = json['user1Email'] as String
    ..user1ProfilePhoto = json['user1ProfilePhoto'] as String
    ..user2UserName = json['user2UserName'] as String
    ..user2Firstname = json['user2Firstname'] as String
    ..user2Lastname = json['user2Lastname'] as String
    ..user2Email = json['user2Email'] as String
    ..user2ProfilePhoto = json['user2ProfilePhoto'] as String;
}

Map<String, dynamic> _$FollowerListDtoToJson(FollowerListDto instance) =>
    <String, dynamic>{
      'followerId': instance.followerId,
      'user1Id': instance.user1Id,
      'user2Id': instance.user2Id,
      'friendshipDate': instance.friendshipDate?.toIso8601String(),
      'isAccepted': instance.isAccepted,
      'isActive': instance.isActive,
      'user1UserName': instance.user1UserName,
      'user1Firstname': instance.user1Firstname,
      'user1Lastname': instance.user1Lastname,
      'user1Email': instance.user1Email,
      'user1ProfilePhoto': instance.user1ProfilePhoto,
      'user2UserName': instance.user2UserName,
      'user2Firstname': instance.user2Firstname,
      'user2Lastname': instance.user2Lastname,
      'user2Email': instance.user2Email,
      'user2ProfilePhoto': instance.user2ProfilePhoto,
    };
