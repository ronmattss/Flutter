import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'Profile.g.dart';

@JsonSerializable()
class Profile {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'studentId')
  String studentId;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'course')
  String course;

  @JsonKey(name: 'age')
  int age;

  // Constructor for the Profile
  /*Profile([int id, String studentId, String password, String course, String name,
      int age]) {
    this.studentId = studentId;
    this.password = password;
    this.course = course;
    this.name = name;
    this.age = age;
    this.id = id;
  }*/

  Profile([this.id,this.studentId,this.password,this.name,this.course,this.age]);
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);            // a factory method to deserialize a JSON string to a Dart Object

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  int get getId => id;

  int get getAge => age;

  String get getPassword => password;

  String get getStudentId => studentId;

  String get getCourse => course;

  String get getName => name;

  void setId(int id) {
    this.id = id;
  }

  void setStudentId(String studentId) {
    this.studentId = studentId;
  }

  void setPassword(String password) {
    this.password = password;
  }

  void setAge(int age) {
    this.age = age;
  }

  void setCourse(String course) {
    this.course = course;
  }

  void setName(String name) {
    this.name = name;
  }
  
  
  //second year first sem

}
