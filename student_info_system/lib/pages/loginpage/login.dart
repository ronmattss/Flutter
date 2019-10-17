import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student_info_system/Models/Grades.dart';
import 'package:student_info_system/Models/Profile.dart';
import 'package:student_info_system/pages/adminpage/admin.dart';
import 'package:student_info_system/pages/mainpage/mainpage.dart';
import 'package:student_info_system/pages/loginpage/login.dart';

void main() {
  Map<int, Color> colorMap = {
    50: Color.fromRGBO(255, 255, 255, .1),
    100: Color.fromRGBO(128, 0, 0, .2),
    200: Color.fromRGBO(128, 0, 0, .3),
    300: Color.fromRGBO(128, 0, 0, .4),
    400: Color.fromRGBO(128, 0, 0, .5),
    500: Color.fromRGBO(128, 0, 0, .6),
    600: Color.fromRGBO(128, 0, 0, .7),
    700: Color.fromRGBO(128, 0, 0, .8),
    800: Color.fromRGBO(128, 0, 0, .9),
    900: Color.fromRGBO(128, 0, 0, 1),
  };
  MaterialColor custom = MaterialColor(0xFF800000, colorMap);
  runApp(MaterialApp(
    title: 'Mobile SIS',
    theme: ThemeData(
      primarySwatch: custom,
    ),
    home: Login(),
  ));
}

/*class firstPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  //  MaterialColor custom = MaterialColor(0xFF800000, colorMap);
    return MaterialApp(
      title: 'Mobile SIS',
      theme: ThemeData(
        primarySwatch: custom,
      ),
      home: login(),
    );
  }
}*/

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Login();
  }
}

class _Login extends State<Login> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  String _emailValue;
  String _passwordValue;

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        image: AssetImage("assets/puplogo.jpg"));
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
        focusColor: Color.fromRGBO(128, 255, 0, 1),
        labelText: 'Username',
        filled: true, /* fillColor: Colors.white*/
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _emailValue = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
        focusColor: Color.fromRGBO(128, 0, 0, 1),
        labelText: 'Password',
        filled: true, /*fillColor: Colors.white*/
      ),
      obscureText: true,
      onChanged: (String value) {
        setState(() {
          _passwordValue = value;
        });
      },
    );
  }

  Future<void> _checkLogin() async {
    print(_emailValue);
    print(_passwordValue);
    Profile student;
    Grades grades;
    if (_emailValue == "adminpls" && _passwordValue == "AdminPls") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => AdminPage()));
    }
    try {
      final String result = await platform.invokeMethod(
          'getSample', <String, String>{
        'user': _emailValue,
        'pass': _passwordValue
      }); /*'getBatteryLevel',<String,int>{'lol':what});*/
      Map profileMap = jsonDecode(result);
      try {
        student = Profile.fromJson(profileMap);
        if (student.studentId == "NULL" || student.password != _passwordValue) {
          Fluttertoast.showToast(
              msg: "Incorrect Username or password!",
              backgroundColor: Color.fromRGBO(128, 255, 0, 1));
        } else {
          final String resultGrades = await platform
              .invokeMethod("getGrades", <String, String>{'id': _emailValue});
          Map gradesMap = jsonDecode(resultGrades);
          grades = Grades.fromJson(gradesMap);

          Fluttertoast.showToast(msg: "syncing.....");
          print(student.studentId);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      MainPage(student, grades)));
        }
      } on NullThrownError catch (e) {}
    } on PlatformException catch (e) {
      //batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
  }

  // send input to check
  void _submitForm() {
    print(_emailValue);
    print(_passwordValue);

    // Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(128, 0, 0, 100),
        title: Text('Mobile System'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              child: Column(
                children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildPasswordTextField(),
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
                        child: Text('LOGIN'),
                        onPressed: _checkLogin,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
