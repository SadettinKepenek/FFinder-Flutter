import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateListDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserListDto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Post_DataTransferObjects/PostListDto.dart';

part 'CommentListDto.g.dart';

@JsonSerializable()
class CommentListDto {
  String commentId;
  String commentBody;
  DateTime commentDate;
  String ownerId;
  String postId;
  bool isActive;
  UserListDto owner;
  PostListDto post;
  List<PostRateListDto> rates;
  CommentListDto() {}

  factory CommentListDto.fromJson(Map<String, dynamic> json) =>
      _$CommentListDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CommentListDtoToJson(this);
}
