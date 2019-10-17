import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student_info_system/Models/Grades.dart';
import 'package:student_info_system/Models/Profile.dart';
import 'package:flutter/services.dart';

class AdminPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AdminState();
  }
}

class _AdminState extends State<AdminPage> with AutomaticKeepAliveClientMixin<AdminPage>{

  static const platform = const MethodChannel('samples.flutter.dev/battery');
  Profile newStudent = new Profile();
  Grades newGrades = new Grades();
  final TextEditingController tController = new TextEditingController();

  Widget _buildInputs(BuildContext context) {

    return SingleChildScrollView(child:  Column(children: <Widget>[
      TextField(
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: "Name",
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (String value) {
            setState(() {
              newStudent.name = value;
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newStudent.name = value;
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextField(
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: "Age",
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              newStudent.age = int.parse(value);
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newStudent.age = int.parse(value);
              ;
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextField(
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: "Student ID",
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (String value) {
            setState(() {
              newStudent.studentId = value;
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newStudent.studentId = value;
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextField(
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: "Course",
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (String value) {
            setState(() {
              newStudent.course = value;
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newStudent.course = value;
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextField(
          obscureText: true,
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: "Password",
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (String value) {
            setState(() {
              newStudent.password = value;
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newStudent.password = value;
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      Row(
        children: <Widget>[
          Container(
            width: 250,
          ),
          RaisedButton(
            textColor: Colors.white,
            splashColor: Color.fromARGB(50, 255, 0, 0),
            color: Color.fromRGBO(128, 0, 0, 0.75),
            child: Text('Confirm'),
            onPressed: () {
              _submit();
            },
          )
        ],
      )
    ]));
  }
  Widget _buildInputsGrades(BuildContext context) {
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
    return SingleChildScrollView(child:  Column(children: <Widget>[
      TextField(
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[0],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              newGrades.firstSub = double.parse(value);
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newGrades.firstSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextField(
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[1],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              newGrades.secondSub = double.parse(value);
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newGrades.secondSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextField(
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[2],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              newGrades.thirdSub = double.parse(value);
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newGrades.thirdSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextField(
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[3],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              newGrades.fourthSub = double.parse(value);
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newGrades.fourthSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextField(
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[4],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              newGrades.fifthSub = double.parse(value);
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newGrades.fifthSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextField(
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[5],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              newGrades.sixthSub = double.parse(value);
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newGrades.sixthSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextField(
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[6],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              newGrades.seventhSub = double.parse(value);
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newGrades.seventhSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextField(
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[7],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              newGrades.eightSub = double.parse(value);
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newGrades.eightSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextField(
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[8],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              newGrades.ninthSub = double.parse(value);
            });
          },
          onSubmitted: (String value) {
            setState(() {
              newGrades.ninthSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      Row(
        children: <Widget>[
          Container(
            width: 250,
          ),
          RaisedButton(
            textColor: Colors.white,
            splashColor: Color.fromARGB(50, 255, 0, 0),
            color: Color.fromRGBO(128, 0, 0, 0.75),
            child: Text('Confirm'),
            onPressed: () {
              Fluttertoast.showToast(msg: "Grades Complete");
              print(newGrades.ninthSub);
            },
          )
        ],
      )
    ]));
  }

  Future<void> _submit() async {
    print(newStudent.name);
    newGrades.stdId = newStudent.studentId;
    String profileString = jsonEncode(newStudent.toJson());
    String gradesString = jsonEncode(newGrades.toJson());

    try {
      String result = await platform
          .invokeMethod('insertProfile', <String, String>{"profile": profileString,"grades":gradesString});
      print(result);
    } on PlatformException catch (e) {}
  }

  Widget _buildBodyMain(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: targetWidth,
            child: Column(
              children: <Widget>[
                _buildInputs(context),
                Row(
                  children: <Widget>[
                    Container(
                      width: 250,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold( resizeToAvoidBottomPadding: true,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(128, 0, 0, 1),
            bottom: TabBar(
              indicatorColor: Color.fromRGBO(254, 222, 0, 1),
              tabs: <Widget>[
                Tab(text: "Add Student Profile"),
                Tab(text: "Add Grades"),
              ],
            ),
            title: Text("Admin Tools Sample"),
          ),
          body: Container(child: TabBarView(
            children: <Widget>[
              _buildInputs(context),
              _buildInputsGrades(context),
            ],
          )),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
