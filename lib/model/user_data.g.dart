// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      bmi: (json['bmi'] as num?)?.toDouble(),
      first: json['first'] as bool?,
      second: json['second'] as bool?,
      third: json['third'] as bool?,
      fourth: json['fourth'] as bool?,
      fifth: json['fifth'] as bool?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'bmi': instance.bmi,
      'first': instance.first,
      'second': instance.second,
      'third': instance.third,
      'fourth': instance.fourth,
      'fifth': instance.fifth,
    };
