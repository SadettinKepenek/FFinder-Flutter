// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentAddDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentAddDto _$CommentAddDtoFromJson(Map<String, dynamic> json) {
  return CommentAddDto()
    ..commentBody = json['commentBody'] as String
    ..commentDate = json['commentDate'] == null
        ? null
        : DateTime.parse(json['commentDate'] as String)
    ..ownerId = json['ownerId'] as String
    ..postId = json['postId'] as String
    ..isActive = json['isActive'] as bool;
}

Map<String, dynamic> _$CommentAddDtoToJson(CommentAddDto instance) =>
    <String, dynamic>{
      'commentBody': instance.commentBody,
      'commentDate': instance.commentDate?.toIso8601String(),
      'ownerId': instance.ownerId,
      'postId': instance.postId,
      'isActive': instance.isActive,
    };
