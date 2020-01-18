
import 'package:json_annotation/json_annotation.dart';
part 'CommentUpdateDto.g.dart';

@JsonSerializable()
class CommentUpdateDto {

  String commentId;
  String commentBody;
  DateTime commentDate;
  String ownerId;
  String postId;
  bool isActive;
  CommentUpdateDto(){}

 factory CommentUpdateDto.fromJson(Map<String, dynamic> json) => _$CommentUpdateDtoFromJson(json);
   Map<String, dynamic> toJson() => _$CommentUpdateDtoToJson(this);
}