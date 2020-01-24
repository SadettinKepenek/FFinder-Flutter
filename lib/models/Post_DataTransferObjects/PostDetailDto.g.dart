// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostDetailDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDetailDto _$PostDetailDtoFromJson(Map<String, dynamic> json) {
  return PostDetailDto()
    ..postId = json['postId'] as String
    ..postImageUrl = json['postImageUrl'] as String
    ..postBody = json['postBody'] as String
    ..publishDate = json['publishDate'] == null
        ? null
        : DateTime.parse(json['publishDate'] as String)
    ..isActive = json['isActive'] as bool
    ..ownerId = json['ownerId'] as String
    ..owner = json['owner'] == null
        ? null
        : UserDetailDto.fromJson(json['owner'] as Map<String, dynamic>)
    ..comments = (json['comments'] as List)
        ?.map((e) => e == null
            ? null
            : CommentListDto.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..rates = (json['rates'] as List)
        ?.map((e) => e == null
            ? null
            : PostRateDetailDto.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PostDetailDtoToJson(PostDetailDto instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'postImageUrl': instance.postImageUrl,
      'postBody': instance.postBody,
      'publishDate': instance.publishDate?.toIso8601String(),
      'isActive': instance.isActive,
      'ownerId': instance.ownerId,
      'owner': instance.owner,
      'comments': instance.comments,
      'rates': instance.rates,
    };
