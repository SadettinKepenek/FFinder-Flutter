import 'package:json_annotation/json_annotation.dart';

part 'FollowerListDto.g.dart';

@JsonSerializable()
class FollowerListDto {
  String followerId;
  String user1Id;
  String user2Id;
  DateTime friendshipDate;
  bool isAccepted;
  bool isActive;
  FollowerListDto() {}

  factory FollowerListDto.fromJson(Map<String, dynamic> json) =>
      _$FollowerListDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FollowerListDtoToJson(this);
}
