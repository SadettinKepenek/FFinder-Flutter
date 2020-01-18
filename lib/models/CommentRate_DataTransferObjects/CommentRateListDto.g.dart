// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentRateListDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRateListDto _$CommentRateListDtoFromJson(Map<String, dynamic> json) {
  return CommentRateListDto()
    ..commentRateId = json['commentRateId'] as String
    ..isLike = json['isLike'] as bool
    ..rateDate = json['rateDate'] == null
        ? null
        : DateTime.parse(json['rateDate'] as String)
    ..commentId = json['commentId'] as String
    ..ownerId = json['ownerId'] as String
    ..isActive = json['isActive'] as bool
    ..owner = json['owner'] == null
        ? null
        : UserListDto.fromJson(json['owner'] as Map<String, dynamic>)
    ..comment = json['comment'] == null
        ? null
        : CommentListDto.fromJson(json['comment'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CommentRateListDtoToJson(CommentRateListDto instance) =>
    <String, dynamic>{
      'commentRateId': instance.commentRateId,
      'isLike': instance.isLike,
      'rateDate': instance.rateDate?.toIso8601String(),
      'commentId': instance.commentId,
      'ownerId': instance.ownerId,
      'isActive': instance.isActive,
      'owner': instance.owner,
      'comment': instance.comment,
    };
