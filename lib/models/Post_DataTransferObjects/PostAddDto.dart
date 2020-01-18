
import 'package:json_annotation/json_annotation.dart';

part 'PostAddDto.g.dart';

@JsonSerializable()
class PostAddDto{
  String postImageUrl;
  String postBody;
  DateTime publishDate;
  bool isActive;
  String ownerId;
  PostAddDto(){}

  factory PostAddDto.fromJson(Map<String, dynamic> json) => _$PostAddDtoFromJson(json);
   Map<String, dynamic> toJson() => _$PostAddDtoToJson(this);
}