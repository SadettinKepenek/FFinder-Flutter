import 'package:json_annotation/json_annotation.dart';


part 'PostUpdateDto.g.dart';

@JsonSerializable()

class PostUpdateDto{

  String postId;
  String postImageUrl;
  String postBody;
  DateTime publishDate;
  bool isActive;
  String ownerId;

  PostUpdateDto(){}

  factory PostUpdateDto.fromJson(Map<String, dynamic> json) => _$PostUpdateDtoFromJson(json);
   Map<String, dynamic> toJson() => _$PostUpdateDtoToJson(this);
}