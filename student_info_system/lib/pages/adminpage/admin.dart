import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student_info_system/Models/Grades.dart';
import 'package:student_info_system/Models/Profile.dart';
import 'package:flutter/services.dart';
import 'package:student_info_system/pages/loginpage/login.dart';

class AdminPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AdminState();
  }
}

class _AdminState extends State<AdminPage>
    with AutomaticKeepAliveClientMixin<AdminPage> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  Profile newStudent = new Profile();
  Grades newGrades = new Grades();
  List<Profile> students = new List<Profile>();
  List<Grades> grades = new List<Grades>();
  String queryStudent;
  final TextEditingController tController = new TextEditingController();

  Widget _buildInputs(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      TextFormField(
          initialValue: newStudent.name != null ? newStudent.name : "Sample",
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
          onSaved: (String value) {
            setState(() {
              newStudent.name = value;
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
          initialValue:
              newStudent.age != null ? newStudent.age.toString() : 0.toString(),
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: "Age",
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              value.toString();
              newStudent.age = int.parse(value);
            });
          },
          onSaved: (String value) {
            setState(() {
              newStudent.age = int.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
          initialValue:
              newStudent.studentId != null ? newStudent.studentId : "Sample",
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
          onSaved: (String value) {
            setState(() {
              newStudent.studentId = value;
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
          initialValue:
              newStudent.course != null ? newStudent.course : "Sample",
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
          onSaved: (String value) {
            setState(() {
              newStudent.course = value;
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
          initialValue:
              newStudent.password != null ? newStudent.password : "Sample",
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
          onSaved: (String value) {
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
              String student = "";
              if (newStudent.studentId == null || newGrades.fifthSub == null) {
                Fluttertoast.showToast(msg: "missing info");
              } else {
                if (students != null) {
                  for (int i = 0; i < students.length; i++) {
                    if (newStudent.studentId == students[i].studentId) {
                      student = newStudent.studentId;
                      break;
                    } else {
                      student = "none";
                    }
                  }
                } else {
                  student = "none";
                }
                if (student == "none" || student == "") {
                  Fluttertoast.showToast(msg: "Adding Info");
                  _submit();
                  _buildInputs(context);
                  _buildInputsGrades(context);
                  _buildList(context);
                } else if (student != "none") {
                  Fluttertoast.showToast(msg: "Updating Info");
                  _updateStudent();
                  _buildInputs(context);
                  _buildInputsGrades(context);
                  _buildList(context);
                }
              }
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

    return SingleChildScrollView(
        child: Column(children: <Widget>[
      TextFormField(
          initialValue: newGrades.firstSub != null
              ? newGrades.firstSub.toString()
              : 0.toString(),
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[0],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              value.toString();
              newGrades.firstSub = double.parse(value);
            });
          },
          onSaved: (String value) {
            setState(() {
              value.toString();
              newGrades.firstSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
          initialValue: newGrades.secondSub != null
              ? newGrades.secondSub.toString()
              : 0.toString(),
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[1],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              value.toString();
              newGrades.secondSub = double.parse(value);
            });
          },
          onSaved: (String value) {
            setState(() {
              value.toString();
              newGrades.secondSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
          initialValue: newGrades.thirdSub != null
              ? newGrades.thirdSub.toString()
              : 0.toString(),
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[2],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              value.toString();
              newGrades.thirdSub = double.parse(value);
            });
          },
          onSaved: (String value) {
            setState(() {
              value.toString();
              newGrades.thirdSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
          initialValue: newGrades.fourthSub != null
              ? newGrades.fourthSub.toString()
              : 0.toString(),
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[3],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              value.toString();
              newGrades.fourthSub = double.parse(value);
            });
          },
          onSaved: (String value) {
            setState(() {
              value.toString();
              newGrades.fourthSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
          initialValue: newGrades.fifthSub != null
              ? newGrades.fifthSub.toString()
              : 0.toString(),
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[4],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              value.toString();
              newGrades.fifthSub = double.parse(value);
            });
          },
          onSaved: (String value) {
            setState(() {
              value.toString();
              newGrades.fifthSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
          initialValue: newGrades.sixthSub != null
              ? newGrades.sixthSub.toString()
              : 0.toString(),
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[5],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              value.toString();
              newGrades.sixthSub = double.parse(value);
            });
          },
          onSaved: (String value) {
            setState(() {
              value.toString();
              newGrades.sixthSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
          initialValue: newGrades.seventhSub != null
              ? newGrades.seventhSub.toString()
              : 0.toString(),
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[6],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              value.toString();
              newGrades.seventhSub = double.parse(value);
            });
          },
          onSaved: (String value) {
            setState(() {
              value.toString();
              newGrades.seventhSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
          initialValue: newGrades.eightSub != null
              ? newGrades.eightSub.toString()
              : 0.toString(),
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[7],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              value.toString();
              newGrades.eightSub = double.parse(value);
            });
          },
          onSaved: (String value) {
            setState(() {
              value.toString();
              newGrades.eightSub = double.parse(value);
            });
          }),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
          initialValue: newGrades.ninthSub != null
              ? newGrades.ninthSub.toString()
              : 0.toString(),
          decoration: InputDecoration(
            focusColor: Color.fromRGBO(128, 255, 0, 1),
            labelText: subs[8],
            filled: true, /* fillColor: Colors.white*/
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              value.toString();
              newGrades.ninthSub = double.parse(value);
            });
          },
          onSaved: (String value) {
            setState(() {
              value.toString();
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
        ],
      )
    ]));
  }

  Future<void> _requestStudents() async {
    try {
      int resultCount = await platform.invokeMethod("getStudentCount");
      print("Students: $resultCount");
      students.removeRange(0, students.length);
      grades.removeRange(0, grades.length);
      for (int i = 0; i < resultCount; i++) {
        String result = await platform
            .invokeMethod("getStudent", <String, Object>{"id": i + 1});

        Map profileMap = jsonDecode(result);
        students.add(Profile.fromJson(profileMap));
        print("errr: ${students.length}");


      }
      for (int i = 0; i < students.length; i++) {
        String resultGrades = await platform.invokeMethod(
            "getUpdatedGrades", <String, Object>{"id": i + 1});

        Map gradesMap = jsonDecode(resultGrades);
        grades.add(Grades.fromJson(gradesMap));
/*        print(
            "students $i: ${students[i].studentId} with Grades: ${grades[i].average()}");*/
      }
    } on PlatformException catch (e) {}
  }


  Future<void> _submit() async {
    print(newStudent.name);
    newGrades.stdId = newStudent.studentId;
    String profileString = jsonEncode(newStudent.toJson());
    String gradesString = jsonEncode(newGrades.toJson());

    try {
      String result = await platform.invokeMethod('insertProfile',
          <String, String>{"profile": profileString, "grades": gradesString});
      print(result);
      Fluttertoast.showToast(msg: result);
    } on PlatformException catch (e) {}
  }

  Future<void> _updateStudent() async {
    String profileString = jsonEncode(newStudent.toJson());
    String gradesString = jsonEncode(newGrades.toJson());

    String result = await platform.invokeMethod(
        'updateDatabase', <String, String>{
      'updateStudent': profileString,
      'updateGrades': gradesString
    });
    Fluttertoast.showToast(msg: result);
  }

  Future<void> _deleteAll() async {
    String result = await platform.invokeMethod('deleteAll');
    Fluttertoast.showToast(msg: result);
  }

  Future<void> _delete() async {
    for (int i = 0; i < students.length; i++) {
      if (queryStudent == students[i].studentId) {
        String result = await platform.invokeMethod(
            'deleteRecord', <String, String>{"student": queryStudent});
        Fluttertoast.showToast(msg: result);
      }
    }
  }

  Widget _buildList(BuildContext context) {
    print(students.length);
    return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
                width: 250,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                    onSaved: (String value) {
                      queryStudent = value;
                    },
                    onChanged: (String value)
                    {queryStudent = value;},
                    decoration: InputDecoration(
                      focusColor: Color.fromRGBO(128, 255, 0, 1),
                      labelText: "Enter Student ID",
                      filled: true, /* fillColor: Colors.white*/
                    ))),
            Wrap(
              children: <Widget>[
                RaisedButton(
                  textColor: Colors.white,
                  splashColor: Color.fromARGB(50, 255, 0, 0),
                  color: Color.fromRGBO(128, 0, 0, 0.75),
                  child: Text('Search'),
                  onPressed: () {
                    setState(() {
                      _buildFuture(context);
                    });
                    Fluttertoast.showToast(msg: "Searching...");
                    print(newGrades.ninthSub);
                  },
                ),
                RaisedButton(
                  textColor: Colors.white,
                  splashColor: Color.fromARGB(50, 255, 0, 0),
                  color: Color.fromRGBO(128, 0, 0, 0.75),
                  child: Text('Show All'),
                  onPressed: () {
                    // _requestStudents();
                    queryStudent = null;
                    setState(() {
                      _buildFuture(context);
                    });
                    Fluttertoast.showToast(msg: "Loading Database");
                  },
                ),
                RaisedButton(
                  textColor: Colors.white,
                  splashColor: Color.fromARGB(50, 255, 0, 0),
                  color: Color.fromRGBO(128, 0, 0, 0.75),
                  child: Text('Delete'),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Deleting $queryStudent");
                    _delete();
                    setState(() {
                      queryStudent = "";
                      _buildFuture(context);
                    });
                    print(newGrades.ninthSub);
                  },
                ),
                RaisedButton(
                  textColor: Colors.white,
                  splashColor: Color.fromARGB(50, 255, 0, 0),
                  color: Color.fromRGBO(128, 0, 0, 0.75),
                  child: Text('Delete All'),
                  onPressed: () {
                    _deleteAll();
                    Fluttertoast.showToast(msg: "Delete all");
                    setState(() {
                      _buildFuture(context);
                      queryStudent = "";
                    });
                    print(newGrades.ninthSub);
                  },
                )
              ],
            ),
            Container(height: 400, child: _buildFuture(context)),
          ],
        ));
  }

  Widget _buildFuture(BuildContext context) {
    return FutureBuilder(
        initialData: students,
        future: _requestStudents(),
        builder: (context, snapshot) {
          if (queryStudent != "") {
            for (int i = 0; i < students.length; i++) {
              if (queryStudent == students[i].studentId) {
                // return ListTIle with student info
                return ListTile(
                  title: Text(students[i].name),
                  subtitle: Text(students[i].studentId),
                  trailing: Text(grades[students.indexOf(students[i])].average().toStringAsPrecision(3)),
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "Editing: ${students[i].name}");
                    setState(() {
                      newStudent = students[i];
                      newGrades = grades[i];
                      _buildInputs(context);
                      _buildInputsGrades(context);
                    });
                  },
                );
              }
            }
          }
          return _buildListView(context);
        });
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(students[index].name),
          subtitle: Text(students[index].studentId),
          trailing: Text(grades[students.indexOf(students[index])].average().toStringAsPrecision(3)),
          onTap: () {
            Fluttertoast.showToast(msg: "Editing: ${students[index].name}");
            setState(() {
              newStudent = students[index];
              newGrades = grades[index];
              _buildInputs(context);
              _buildInputsGrades(context);
            });
          },
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomPadding: true,
          appBar: AppBar(
            actions: <Widget>[
              FlatButton(
                child: Text("Logout",style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Login()));
                },
              )
            ],
            backgroundColor: Color.fromRGBO(128, 0, 0, 1),
            bottom: TabBar(
              indicatorColor: Color.fromRGBO(254, 222, 0, 1),
              tabs: <Widget>[
                Tab(text: "Add Student Profile"),
                Tab(text: "Add Grades"),
                Tab(text: "List of Students "),
              ],
            ),
            title: Text("Admin Tools Sample"),
          ),
          body: Container(
              child: TabBarView(
            children: <Widget>[
              _buildInputs(context),
              _buildInputsGrades(context),
              _buildList(context),
            ],
          )),
        ),
      ),
    );
  }
}
