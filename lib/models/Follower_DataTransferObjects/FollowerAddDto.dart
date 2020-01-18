import 'package:json_annotation/json_annotation.dart';

part 'FollowerAddDto.g.dart';

@JsonSerializable()
class FollowerAddDto {
  String user1Id;
  String user2Id;
  DateTime friendshipDate;
  bool isAccepted;
  bool isActive;
  FollowerAddDto() {}

  factory FollowerAddDto.fromJson(Map<String, dynamic> json) =>
      _$FollowerAddDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FollowerAddDtoToJson(this);
}
