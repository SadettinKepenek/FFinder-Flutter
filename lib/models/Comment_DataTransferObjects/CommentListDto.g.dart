// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentListDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentListDto _$CommentListDtoFromJson(Map<String, dynamic> json) {
  return CommentListDto()
    ..commentId = json['commentId'] as String
    ..commentBody = json['commentBody'] as String
    ..commentDate = json['commentDate'] == null
        ? null
        : DateTime.parse(json['commentDate'] as String)
    ..ownerId = json['ownerId'] as String
    ..postId = json['postId'] as String
    ..isActive = json['isActive'] as bool;
}

Map<String, dynamic> _$CommentListDtoToJson(CommentListDto instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'commentBody': instance.commentBody,
      'commentDate': instance.commentDate?.toIso8601String(),
      'ownerId': instance.ownerId,
      'postId': instance.postId,
      'isActive': instance.isActive,
    };
