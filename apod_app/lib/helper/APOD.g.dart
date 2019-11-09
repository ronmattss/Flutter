// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'APOD.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APOD _$APODFromJson(Map<String, dynamic> json) {
  return APOD(
      copyright: json['copyright'] as String,
      date: json['date'] as String,
      explanation: json['explanation'] as String,
      hdurl: json['hdurl'] as String,
      title: json['title'] as String);
}

Map<String, dynamic> _$APODToJson(APOD instance) => <String, dynamic>{
      'copyright': instance.copyright,
      'date': instance.date,
      'explanation': instance.explanation,
      'hdurl': instance.hdurl,
      'title': instance.title
    };
