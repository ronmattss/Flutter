import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_info_system/Models/Grades.dart';
import 'package:student_info_system/Models/Profile.dart';
import 'package:student_info_system/pages/mainpage/gradecard.dart';

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(128, 0, 0, 1),
            bottom: TabBar(
              indicatorColor: Color.fromRGBO(254, 222, 0, 1),
              tabs: <Widget>[
                Tab(text: "Profile"),
                Tab(text: "Grades"),
              ],
            ),
            title: Text("Polytechnic University of the Philippines"),
          ),
          body: Container(child: TabBarView(
            children: <Widget>[
              _buildBody(context),
              GradeCard(widget.grades),
            ],
          )),
        ),
      ),
    );
  }
}
