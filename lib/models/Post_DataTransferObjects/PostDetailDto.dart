
import 'package:json_annotation/json_annotation.dart';

part 'PostDetailDto.g.dart';

@JsonSerializable()
class PostDetailDto{
  String postId;
  String postImageUrl;
  String postBody;
  DateTime publishDate;
  bool isActive;
  String ownerId;
  PostDetailDto();

  factory PostDetailDto.fromJson(Map<String, dynamic> json) => _$PostDetailDtoFromJson(json);
   Map<String, dynamic> toJson() => _$PostDetailDtoToJson(this);

}