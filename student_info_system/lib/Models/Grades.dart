class Grades
{
  int id;
  String stdId;
  double firstSub;
  double secondSub;
  double thirdSub;
  double fourthSub;
  double fifthSub;
  double sixthSub;
  double seventhSub;
  double eightSub;
  double ninthSub;


  Grades([int id, String stdId,double firstSub,double secondSub, double thirdSub, double fourthSub, double fifthSub, double sixthSub, double seventhSub, double eightSub, double ninthSub])
  {
    this.id = id;
    this.stdId = stdId;
    this.firstSub = firstSub;
    this.secondSub = secondSub;
    this.thirdSub = thirdSub;
    this.fourthSub = fourthSub;
    this.fifthSub = fifthSub;
    this.sixthSub = sixthSub;
    this.seventhSub = seventhSub;
    this.eightSub = eightSub;
    this.ninthSub = ninthSub;
  }

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
}