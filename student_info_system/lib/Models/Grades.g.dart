// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Grades.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grades _$GradesFromJson(Map<String, dynamic> json) {
  return Grades(
      json['id'] as int,
      json['stdId'] as String,
      (json['firstSub'] as num)?.toDouble(),
      (json['secondSub'] as num)?.toDouble(),
      (json['thirdSub'] as num)?.toDouble(),
      (json['fourthSub'] as num)?.toDouble(),
      (json['fifthSub'] as num)?.toDouble(),
      (json['sixthSub'] as num)?.toDouble(),
      (json['seventhSub'] as num)?.toDouble(),
      (json['eightSub'] as num)?.toDouble(),
      (json['ninthSub'] as num)?.toDouble());
}

Map<String, dynamic> _$GradesToJson(Grades instance) => <String, dynamic>{
      'id': instance.id,
      'stdId': instance.stdId,
      'firstSub': instance.firstSub,
      'secondSub': instance.secondSub,
      'thirdSub': instance.thirdSub,
      'fourthSub': instance.fourthSub,
      'fifthSub': instance.fifthSub,
      'sixthSub': instance.sixthSub,
      'seventhSub': instance.seventhSub,
      'eightSub': instance.eightSub,
      'ninthSub': instance.ninthSub
    };
