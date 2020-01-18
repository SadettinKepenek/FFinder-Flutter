
import 'package:json_annotation/json_annotation.dart';
part 'PostRateUpdateDto.g.dart';
@JsonSerializable()
class PostRateUpdateDto {
  String postRateId;
  String postId;
  String ownerId;
  bool isActive;
  bool isLike;
  DateTime rateDate;
  PostRateUpdateDto();

  factory PostRateUpdateDto.fromJson(Map<String, dynamic> json) => _$PostRateUpdateDtoFromJson(json);
   Map<String, dynamic> toJson() => _$PostRateUpdateDtoToJson(this);
}
