import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  double? height;
  double? weight;
  double? bmi;
  bool? first;
  bool? second;
  bool? third;
  bool? fourth;
  bool? fifth;

  UserData({
    this.height,
    this.weight,
    this.bmi,
    this.first,
    this.second,
    this.third,
    this.fourth,
    this.fifth,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
      
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
