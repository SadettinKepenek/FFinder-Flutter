// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentUpdateDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentUpdateDto _$CommentUpdateDtoFromJson(Map<String, dynamic> json) {
  return CommentUpdateDto()
    ..commentId = json['commentId'] as String
    ..commentBody = json['commentBody'] as String
    ..commentDate = json['commentDate'] == null
        ? null
        : DateTime.parse(json['commentDate'] as String)
    ..ownerId = json['ownerId'] as String
    ..postId = json['postId'] as String
    ..isActive = json['isActive'] as bool;
}

Map<String, dynamic> _$CommentUpdateDtoToJson(CommentUpdateDto instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'commentBody': instance.commentBody,
      'commentDate': instance.commentDate?.toIso8601String(),
      'ownerId': instance.ownerId,
      'postId': instance.postId,
      'isActive': instance.isActive,
    };
