// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentRateAddDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRateAddDto _$CommentRateAddDtoFromJson(Map<String, dynamic> json) {
  return CommentRateAddDto()
    ..isLike = json['isLike'] as bool
    ..rateDate = json['rateDate'] == null
        ? null
        : DateTime.parse(json['rateDate'] as String)
    ..commentId = json['commentId'] as String
    ..ownerId = json['ownerId'] as String
    ..isActive = json['isActive'] as bool;
}

Map<String, dynamic> _$CommentRateAddDtoToJson(CommentRateAddDto instance) =>
    <String, dynamic>{
      'isLike': instance.isLike,
      'rateDate': instance.rateDate?.toIso8601String(),
      'commentId': instance.commentId,
      'ownerId': instance.ownerId,
      'isActive': instance.isActive,
    };
