import 'package:json_annotation/json_annotation.dart';

part 'CommentListDto.g.dart';

@JsonSerializable()
class CommentListDto {
   String commentId;
         String commentBody;
         DateTime commentDate;
         String ownerId;
         String postId;
         bool isActive;
  CommentListDto(){}

  factory CommentListDto.fromJson(Map<String, dynamic> json) => _$CommentListDtoFromJson(json);
   Map<String, dynamic> toJson() => _$CommentListDtoToJson(this);
}