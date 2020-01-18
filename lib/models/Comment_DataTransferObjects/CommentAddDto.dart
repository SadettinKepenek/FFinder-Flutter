import 'package:json_annotation/json_annotation.dart';

part 'CommentAddDto.g.dart';

@JsonSerializable()
class CommentAddDto {
  String commentBody;
  DateTime commentDate;
  String ownerId;
  String postId;
  bool isActive;
  CommentAddDto(){}
  
  factory CommentAddDto.fromJson(Map<String, dynamic> json) => _$CommentAddDtoFromJson(json);
   Map<String, dynamic> toJson() => _$CommentAddDtoToJson(this);
}
