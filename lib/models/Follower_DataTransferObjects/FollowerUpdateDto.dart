import 'package:json_annotation/json_annotation.dart';

part 'FollowerUpdateDto.g.dart';

@JsonSerializable()
class FollowerUpdateDto {
  String followerId;
  String user1Id;
  String user2Id;
  DateTime friendshipDate;
  bool isAccepted;
  bool isActive;
  FollowerUpdateDto() {}

  factory FollowerUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$FollowerUpdateDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FollowerUpdateDtoToJson(this);
}
