// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostRateListDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRateListDto _$PostRateListDtoFromJson(Map<String, dynamic> json) {
  return PostRateListDto()
    ..postRateId = json['postRateId'] as String
    ..postId = json['postId'] as String
    ..ownerId = json['ownerId'] as String
    ..isActive = json['isActive'] as bool
    ..isLike = json['isLike'] as bool
    ..rateDate = json['rateDate'] == null
        ? null
        : DateTime.parse(json['rateDate'] as String)
    ..post = json['post'] == null
        ? null
        : PostListDto.fromJson(json['post'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PostRateListDtoToJson(PostRateListDto instance) =>
    <String, dynamic>{
      'postRateId': instance.postRateId,
      'postId': instance.postId,
      'ownerId': instance.ownerId,
      'isActive': instance.isActive,
      'isLike': instance.isLike,
      'rateDate': instance.rateDate?.toIso8601String(),
      'post': instance.post,
    };
