// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentRateUpdateDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRateUpdateDto _$CommentRateUpdateDtoFromJson(Map<String, dynamic> json) {
  return CommentRateUpdateDto()
    ..commentRateId = json['commentRateId'] as String
    ..isLike = json['isLike'] as bool
    ..rateDate = json['rateDate'] == null
        ? null
        : DateTime.parse(json['rateDate'] as String)
    ..commentId = json['commentId'] as String
    ..ownerId = json['ownerId'] as String
    ..isActive = json['isActive'] as bool;
}

Map<String, dynamic> _$CommentRateUpdateDtoToJson(
        CommentRateUpdateDto instance) =>
    <String, dynamic>{
      'commentRateId': instance.commentRateId,
      'isLike': instance.isLike,
      'rateDate': instance.rateDate?.toIso8601String(),
      'commentId': instance.commentId,
      'ownerId': instance.ownerId,
      'isActive': instance.isActive,
    };
