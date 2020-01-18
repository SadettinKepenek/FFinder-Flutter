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
    ..isActive = json['isActive'] as bool;
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
    };
