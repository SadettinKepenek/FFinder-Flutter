
import 'package:ffinder/models/Post_DataTransferObjects/PostListDto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'PostRateDetailDto.g.dart';
@JsonSerializable()
class PostRateDetailDto {
  String postRateId;
  String postId;
  String ownerId;
  bool isActive;
  bool isLike;
  DateTime rateDate;
  PostListDto post;
  PostRateDetailDto();

  factory PostRateDetailDto.fromJson(Map<String, dynamic> json) => _$PostRateDetailDtoFromJson(json);
   Map<String, dynamic> toJson() => _$PostRateDetailDtoToJson(this);
}
