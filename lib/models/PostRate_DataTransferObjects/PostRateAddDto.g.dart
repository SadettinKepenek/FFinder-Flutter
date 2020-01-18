// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostRateAddDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRateAddDto _$PostRateAddDtoFromJson(Map<String, dynamic> json) {
  return PostRateAddDto()
    ..postId = json['postId'] as String
    ..ownerId = json['ownerId'] as String
    ..isActive = json['isActive'] as bool
    ..isLike = json['isLike'] as bool
    ..rateDate = json['rateDate'] == null
        ? null
        : DateTime.parse(json['rateDate'] as String);
}

Map<String, dynamic> _$PostRateAddDtoToJson(PostRateAddDto instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'ownerId': instance.ownerId,
      'isActive': instance.isActive,
      'isLike': instance.isLike,
      'rateDate': instance.rateDate?.toIso8601String(),
    };
