import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_info_system/Models/Profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Profile p;// = new Profile();
  String title = "Title Placeholder";
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';
  String sample = "2131";
  String what = "";
  String _emailValue = "2018-0000-MN-0";
  String _passwordValue = "qwerty";


  Future<void> _getSample() async {
    String batteryLevel;

    try {
      final String result = await platform.invokeMethod('getSample',<String,String>{'user':_emailValue,'pass':_passwordValue});/*'getBatteryLevel',<String,int>{'lol':what});*/
      Map profileMap = jsonDecode(result);
      try{
        p = Profile.fromJson(profileMap);
        if(p.studentId == "NULL")
          {
            what ="ERROR";
          }
        else
          {
            what = p.name;
            print(p.id);
            print(p.studentId);
            print(p.name);
            print(p.password);
            print(p.course);
            print(p.age);
            sample = _counter.toString();
            batteryLevel = p.studentId;
          }

      }
      on NullThrownError catch (e)
      {
        batteryLevel =e.toString();
      }

    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      if(p.studentId == "NULL")
      {
        _batteryLevel = "SHIT";
        title = "ERROR NOT FOUND";
      }
      else {
        _batteryLevel = p.studentId;
        title = what;
        _counter = p.age;
      }


    });
  }
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _batteryLevel,
            ),
            Text(
              sample.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getSample,
        tooltip: _batteryLevel,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
