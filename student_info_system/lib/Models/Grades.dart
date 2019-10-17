import 'package:json_annotation/json_annotation.dart';

part 'Grades.g.dart';

@JsonSerializable()
class Grades {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'stdId')
  String stdId;
  @JsonKey(name: 'firstSub')
  double firstSub;
  @JsonKey(name: 'secondSub')
  double secondSub;
  @JsonKey(name: 'thirdSub')
  double thirdSub;
  @JsonKey(name: 'fourthSub')
  double fourthSub;
  @JsonKey(name: 'fifthSub')
  double fifthSub;
  @JsonKey(name: 'sixthSub')
  double sixthSub;
  @JsonKey(name: 'seventhSub')
  double seventhSub;
  @JsonKey(name: 'eightSub')
  double eightSub;
  @JsonKey(name: 'ninthSub')
  double ninthSub;

  Grades([
      this.id,
      this.stdId,
      this.firstSub,
      this.secondSub,
      this.thirdSub,
      this.fourthSub,
      this.fifthSub,
      this.sixthSub,
      this.seventhSub,
      this.eightSub,
      this.ninthSub]);

  factory Grades.fromJson(Map<String, dynamic> json) => _$GradesFromJson(
      json); // a factory method to deserialize a JSON string to a Dart Object

  Map<String, dynamic> toJson() => _$GradesToJson(this);

  get getId => id;

  get getstdId => stdId;

  get getFirstSub => firstSub;

  get getSecondSub => secondSub;

  get getThirdSub => thirdSub;

  get getFourthSub => fourthSub;

  get getFifthSub => fifthSub;

  get getSixthSub => sixthSub;

  get getSeventhSub => seventhSub;

  get getEightSub => eightSub;

  get getNinthSub => ninthSub;

  List<String> subjects()
  {
    List<String> subs = new List<String>();
    subs.add("Data Structures and Algorithms");
    subs.add("Discrete Structures");
    subs.add("Object Oriented Programming");
    subs.add("Modelling and Simulation");
    subs.add("Logic Design");
    subs.add("CS Free Elective");
    subs.add("Ethics");
    subs.add("World Literature");
    subs.add("Physical Education");
    return subs;
  }

  List<String> subjectCodes()
  {
    List<String> subs = new List<String>();
    subs.add("COMP 200337");
    subs.add("COMP 20043");
    subs.add("COMP 20083");
    subs.add("COMP 20087");
    subs.add("COMP 20039");
    subs.add("GEED 10042");
    subs.add("GEED 10093");
    subs.add("GEED 10064");
    subs.add("GEED 10022");
    return subs;
  }
  List<double> grades()
  {
    List<double> subs = new List<double>();
    subs.add(firstSub);
    subs.add(secondSub);
    subs.add(thirdSub);
    subs.add(fourthSub);
    subs.add(fifthSub);
    subs.add(sixthSub);
    subs.add(seventhSub);
    subs.add(eightSub);
    subs.add(ninthSub);


    return subs;
  }

  double average()
  {
    double g = (firstSub + secondSub + thirdSub + fourthSub +fifthSub +sixthSub + seventhSub +eightSub +ninthSub)/9;
    return g;
  }
}
