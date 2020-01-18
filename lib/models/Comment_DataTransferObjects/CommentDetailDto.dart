import 'package:json_annotation/json_annotation.dart';

part 'CommentDetailDto.g.dart';

@JsonSerializable()
class CommentDetailDto {
   String commentId;
   String commentBody;
   DateTime commentDate;
   String ownerId;
   String postId;
   bool isActive;
  CommentDetailDto(){}

  factory CommentDetailDto.fromJson(Map<String, dynamic> json) => _$CommentDetailDtoFromJson(json);
   Map<String, dynamic> toJson() => _$CommentDetailDtoToJson(this);
}