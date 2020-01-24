// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostRateDetailDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRateDetailDto _$PostRateDetailDtoFromJson(Map<String, dynamic> json) {
  return PostRateDetailDto()
    ..postRateId = json['postRateId'] as String
    ..postId = json['postId'] as String
    ..ownerId = json['ownerId'] as String
    ..isActive = json['isActive'] as bool
    ..isLike = json['isLike'] as bool
    ..rateDate = json['rateDate'] == null
        ? null
        : DateTime.parse(json['rateDate'] as String)
    ..ownerUserName = json['ownerUserName'] as String
    ..ownerFirstname = json['ownerFirstname'] as String
    ..ownerLastname = json['ownerLastname'] as String
    ..ownerEmail = json['ownerEmail'] as String
    ..ownerProfilePhoto = json['ownerProfilePhoto'] as String
    ..postImageUrl = json['postImageUrl'] as String
    ..postBody = json['postBody'] as String
    ..postPublishDate = json['postPublishDate'] == null
        ? null
        : DateTime.parse(json['postPublishDate'] as String)
    ..postOwnerId = json['postOwnerId'] as String
    ..postOwnerProfilePhoto = json['postOwnerProfilePhoto'] as String
    ..postIsActive = json['postIsActive'] as bool;
}

Map<String, dynamic> _$PostRateDetailDtoToJson(PostRateDetailDto instance) =>
    <String, dynamic>{
      'postRateId': instance.postRateId,
      'postId': instance.postId,
      'ownerId': instance.ownerId,
      'isActive': instance.isActive,
      'isLike': instance.isLike,
      'rateDate': instance.rateDate?.toIso8601String(),
      'ownerUserName': instance.ownerUserName,
      'ownerFirstname': instance.ownerFirstname,
      'ownerLastname': instance.ownerLastname,
      'ownerEmail': instance.ownerEmail,
      'ownerProfilePhoto': instance.ownerProfilePhoto,
      'postImageUrl': instance.postImageUrl,
      'postBody': instance.postBody,
      'postPublishDate': instance.postPublishDate?.toIso8601String(),
      'postOwnerId': instance.postOwnerId,
      'postOwnerProfilePhoto': instance.postOwnerProfilePhoto,
      'postIsActive': instance.postIsActive,
    };
