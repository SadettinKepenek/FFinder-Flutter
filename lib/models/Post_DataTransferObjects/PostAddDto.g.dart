// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostAddDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostAddDto _$PostAddDtoFromJson(Map<String, dynamic> json) {
  return PostAddDto()
    ..postImageUrl = json['postImageUrl'] as String
    ..postBody = json['postBody'] as String
    ..publishDate = json['publishDate'] == null
        ? null
        : DateTime.parse(json['publishDate'] as String)
    ..isActive = json['isActive'] as bool
    ..ownerId = json['ownerId'] as String;
}

Map<String, dynamic> _$PostAddDtoToJson(PostAddDto instance) =>
    <String, dynamic>{
      'postImageUrl': instance.postImageUrl,
      'postBody': instance.postBody,
      'publishDate': instance.publishDate?.toIso8601String(),
      'isActive': instance.isActive,
      'ownerId': instance.ownerId,
    };
