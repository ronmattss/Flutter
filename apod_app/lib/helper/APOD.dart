import 'package:json_annotation/json_annotation.dart';
part 'APOD.g.dart';


// Model class for the APOD
@JsonSerializable()
class APOD
{
  @JsonKey(name:'copyright')
 final String copyright;
 @JsonKey(name:'date')
 final String date;
 @JsonKey(name:'explanation')
 final String explanation;
 @JsonKey(name:'hdurl')
 
 final String hdurl;
 @JsonKey(name:'title')
 final String title;
 
 APOD({this.copyright,this.date,this.explanation,this.hdurl,this.title});

 factory APOD.fromJson(Map<String,dynamic> json) => _$APODFromJson(json);
 
 Map<String, dynamic> toJson() => _$APODToJson(this);

}