import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_info_system/Models/Grades.dart';
import 'package:student_info_system/Models/Profile.dart';
import 'package:student_info_system/pages/loginpage/login.dart';
import 'package:student_info_system/pages/mainpage/gradecard.dart';
import 'package:student_info_system/pages/mainpage/schedulecard.dart';

class MainPage extends StatefulWidget {
  final Profile profile;
  final Grades grades;

  MainPage(this.profile, this.grades);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

DecorationImage _buildBackgroundImage() {
  return DecorationImage(
      colorFilter:
      ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage("assets/puplogo.jpg"));
}

class _MainPageState extends State<MainPage> {
  Widget _buildBody(BuildContext context) {
    return Container(
        decoration: BoxDecoration(image: _buildBackgroundImage()),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Center(
          child: Column(children: <Widget>[
            Text(widget.profile.studentId),
            Text(widget.profile.name),
            Text(widget.profile.course),
            Text(widget.profile.age.toString()),
          ]),
          // Text(widget.profile.studentId)
        ));
  }
  Widget rowCell(String count, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$count',style: new TextStyle(color: Colors.black),),
    new Text(type,style: new TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
  ],));
  Widget _profile(BuildContext context)
  {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Stack(children: <Widget>[
     Container(color:Colors.white),
    Scaffold(

        backgroundColor: Colors.transparent,
        body: new Center(
          child: new Column(
            children: <Widget>[
              new SizedBox(height: _height/12,),
              new SizedBox(height: _height/25.0,),
              new Text(widget.profile.name, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.black),),
              new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8)),
              new Divider(height: _height/30,color: Colors.black,),
              new Row(
                children: <Widget>[
                  rowCell(widget.profile.course, 'Course'),
                  rowCell(widget.profile.studentId, 'Student ID'),
                  rowCell(widget.grades.average().toStringAsPrecision(2), 'GPA'),
                ],),
              new Divider(height: _height/30,color: Colors.black),
              new Padding(padding: new EdgeInsets.only(left: _width/8, right: _width/8), child: new FlatButton(onPressed: (){},
                child: new Container(child: new Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                  new Icon(Icons.person),
                  new SizedBox(width: _width/30,),
                  new Text('Regular Student')
                ],)),color: Colors.white,),),
            ],
          ),
        )
    )
    ],);
  }




  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              FlatButton(onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Login())); // go back to the login page
              }, child: Text("Logout",style: TextStyle(color: Colors.white),)),
            ],
            backgroundColor: Color.fromRGBO(128, 0, 0, 1),
            bottom: TabBar(
              indicatorColor: Color.fromRGBO(254, 222, 0, 1),
              tabs: <Widget>[
                Tab(text: "Profile"),
                Tab(text: "Grades"),
                Tab(text: "Schedule"),
              ],
            ),
            title: Text("Student Information"),
          ),
          body: Container(
              child: TabBarView(
                children: <Widget>[
                  _profile(context),
                  GradeCard(widget.grades),
                  ScheduleCard()
                ],
              )),
        ),
      ),
    );
  }
}
