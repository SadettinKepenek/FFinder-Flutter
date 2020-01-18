
import 'package:json_annotation/json_annotation.dart';

part 'PostListDto.g.dart';

@JsonSerializable()
class PostListDto{
  String postId;
  String postImageUrl;
  String postBody;
  DateTime publishDate;
  bool isActive;
  String ownerId;
  PostListDto();

  factory PostListDto.fromJson(Map<String, dynamic> json) => _$PostListDtoFromJson(json);
   Map<String, dynamic> toJson() => _$PostListDtoToJson(this);

}