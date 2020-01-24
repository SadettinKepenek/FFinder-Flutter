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
  String user1UserName;
  String user1Firstname;
  String user1Lastname;
  String user1Email;
  String user1ProfilePhoto;
  String user2UserName;
  String user2Firstname;
  String user2Lastname;
  String user2Email;
  String user2ProfilePhoto;
  FollowerDetailDto() {}

  factory FollowerDetailDto.fromJson(Map<String, dynamic> json) =>
      _$FollowerDetailDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FollowerDetailDtoToJson(this);
}
