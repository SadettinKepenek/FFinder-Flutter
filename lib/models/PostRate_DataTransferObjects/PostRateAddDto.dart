
import 'package:json_annotation/json_annotation.dart';
part 'PostRateAddDto.g.dart';
@JsonSerializable()
class PostRateAddDto {
  String postId;
  String ownerId;
  bool isActive;
  bool isLike;
  DateTime rateDate;
  PostRateAddDto();

  factory PostRateAddDto.fromJson(Map<String, dynamic> json) => _$PostRateAddDtoFromJson(json);
   Map<String, dynamic> toJson() => _$PostRateAddDtoToJson(this);
}
