// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostListDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostListDto _$PostListDtoFromJson(Map<String, dynamic> json) {
  return PostListDto()
    ..postId = json['postId'] as String
    ..postImageUrl = json['postImageUrl'] as String
    ..postBody = json['postBody'] as String
    ..publishDate = json['publishDate'] == null
        ? null
        : DateTime.parse(json['publishDate'] as String)
    ..isActive = json['isActive'] as bool
    ..ownerId = json['ownerId'] as String
    ..ownerUserName = json['ownerUserName'] as String
    ..ownerFirstname = json['ownerFirstname'] as String
    ..ownerLastname = json['ownerLastname'] as String
    ..ownerEmail = json['ownerEmail'] as String
    ..ownerProfilePhoto = json['ownerProfilePhoto'] as String
    ..comments = (json['comments'] as List)
        ?.map((e) => e == null
            ? null
            : CommentListDto.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..rates = (json['rates'] as List)
        ?.map((e) => e == null
            ? null
            : PostRateListDto.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PostListDtoToJson(PostListDto instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'postImageUrl': instance.postImageUrl,
      'postBody': instance.postBody,
      'publishDate': instance.publishDate?.toIso8601String(),
      'isActive': instance.isActive,
      'ownerId': instance.ownerId,
      'ownerUserName': instance.ownerUserName,
      'ownerFirstname': instance.ownerFirstname,
      'ownerLastname': instance.ownerLastname,
      'ownerEmail': instance.ownerEmail,
      'ownerProfilePhoto': instance.ownerProfilePhoto,
      'comments': instance.comments,
      'rates': instance.rates,
    };
