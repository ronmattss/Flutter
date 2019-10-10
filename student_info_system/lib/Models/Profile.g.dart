// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
      json['id'] as int,
      json['studentId'] as String,
      json['password'] as String,
      json['course'] as String,
      json['name'] as String,
      json['age'] as int);
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'password': instance.password,
      'name': instance.name,
      'course': instance.course,
      'age': instance.age
    };
