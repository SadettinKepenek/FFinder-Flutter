// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostRateUpdateDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRateUpdateDto _$PostRateUpdateDtoFromJson(Map<String, dynamic> json) {
  return PostRateUpdateDto()
    ..postRateId = json['postRateId'] as String
    ..postId = json['postId'] as String
    ..ownerId = json['ownerId'] as String
    ..isActive = json['isActive'] as bool
    ..isLike = json['isLike'] as bool
    ..rateDate = json['rateDate'] == null
        ? null
        : DateTime.parse(json['rateDate'] as String);
}

Map<String, dynamic> _$PostRateUpdateDtoToJson(PostRateUpdateDto instance) =>
    <String, dynamic>{
      'postRateId': instance.postRateId,
      'postId': instance.postId,
      'ownerId': instance.ownerId,
      'isActive': instance.isActive,
      'isLike': instance.isLike,
      'rateDate': instance.rateDate?.toIso8601String(),
    };
