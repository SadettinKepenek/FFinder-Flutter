import 'package:ffinder/models/User_DataTransferObjects/UserDetailDto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'FollowerDetailDto.g.dart';

@JsonSerializable()
class FollowerDetailDto {
  String followerId;
  String user1Id;
  String user2Id;
  DateTime friendshipDate;
  bool isAccepted;
  bool isActive;
  UserDetailDto user1;
  UserDetailDto user2;
  FollowerDetailDto() {}

  factory FollowerDetailDto.fromJson(Map<String, dynamic> json) =>
      _$FollowerDetailDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FollowerDetailDtoToJson(this);
}
