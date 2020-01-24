// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentDetailDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentDetailDto _$CommentDetailDtoFromJson(Map<String, dynamic> json) {
  return CommentDetailDto()
    ..commentId = json['commentId'] as String
    ..commentBody = json['commentBody'] as String
    ..commentDate = json['commentDate'] == null
        ? null
        : DateTime.parse(json['commentDate'] as String)
    ..ownerId = json['ownerId'] as String
    ..postId = json['postId'] as String
    ..isActive = json['isActive'] as bool
    ..owner = json['owner'] == null
        ? null
        : UserDetailDto.fromJson(json['owner'] as Map<String, dynamic>)
    ..post = json['post'] == null
        ? null
        : PostDetailDto.fromJson(json['post'] as Map<String, dynamic>)
    ..rates = (json['rates'] as List)
        ?.map((e) => e == null
            ? null
            : CommentRateDetailDto.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CommentDetailDtoToJson(CommentDetailDto instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'commentBody': instance.commentBody,
      'commentDate': instance.commentDate?.toIso8601String(),
      'ownerId': instance.ownerId,
      'postId': instance.postId,
      'isActive': instance.isActive,
      'owner': instance.owner,
      'post': instance.post,
      'rates': instance.rates,
    };
