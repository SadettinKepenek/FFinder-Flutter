// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentRateDetailDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRateDetailDto _$CommentRateDetailDtoFromJson(Map<String, dynamic> json) {
  return CommentRateDetailDto()
    ..commentRateId = json['commentRateId'] as String
    ..isLike = json['isLike'] as bool
    ..rateDate = json['rateDate'] == null
        ? null
        : DateTime.parse(json['rateDate'] as String)
    ..commentId = json['commentId'] as String
    ..ownerId = json['ownerId'] as String
    ..isActive = json['isActive'] as bool
    ..ownerUserName = json['ownerUserName'] as String
    ..ownerFirstname = json['ownerFirstname'] as String
    ..ownerLastname = json['ownerLastname'] as String
    ..ownerEmail = json['ownerEmail'] as String
    ..ownerProfilePhoto = json['ownerProfilePhoto'] as String
    ..commentBody = json['commentBody'] as String
    ..commentDate = json['commentDate'] == null
        ? null
        : DateTime.parse(json['commentDate'] as String)
    ..commentOwnerId = json['commentOwnerId'] as String
    ..commentPostId = json['commentPostId'] as String;
}

Map<String, dynamic> _$CommentRateDetailDtoToJson(
        CommentRateDetailDto instance) =>
    <String, dynamic>{
      'commentRateId': instance.commentRateId,
      'isLike': instance.isLike,
      'rateDate': instance.rateDate?.toIso8601String(),
      'commentId': instance.commentId,
      'ownerId': instance.ownerId,
      'isActive': instance.isActive,
      'ownerUserName': instance.ownerUserName,
      'ownerFirstname': instance.ownerFirstname,
      'ownerLastname': instance.ownerLastname,
      'ownerEmail': instance.ownerEmail,
      'ownerProfilePhoto': instance.ownerProfilePhoto,
      'commentBody': instance.commentBody,
      'commentDate': instance.commentDate?.toIso8601String(),
      'commentOwnerId': instance.commentOwnerId,
      'commentPostId': instance.commentPostId,
    };
