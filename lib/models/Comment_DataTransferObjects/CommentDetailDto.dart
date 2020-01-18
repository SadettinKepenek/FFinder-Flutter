import 'package:ffinder/models/PostRate_DataTransferObjects/PostRateDetailDto.dart';
import 'package:ffinder/models/User_DataTransferObjects/UserDetailDto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Post_DataTransferObjects/PostDetailDto.dart';

part 'CommentDetailDto.g.dart';

@JsonSerializable()
class CommentDetailDto {
  String commentId;
  String commentBody;
  DateTime commentDate;
  String ownerId;
  String postId;
  bool isActive;
  UserDetailDto owner;
  PostDetailDto post;
  List<PostRateDetailDto> rates;
  CommentDetailDto() {}

  factory CommentDetailDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDetailDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CommentDetailDtoToJson(this);
}
