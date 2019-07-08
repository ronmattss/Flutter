import 'package:flutter/material.dart';

import '../main_screen/main_list.dart';
import '../create_page/create_screen.dart';
import '../helper_classes/data.dart';
import 'package:myapp/helper_classes/crud.dart';
import 'package:myapp/helper_classes/data.dart';

// Data will be changed to a database entry
// A profile for the user to

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    // print(data.dataList);
    super.initState();
  }

  void gotoCreateTaskPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => CreateTaskScreen()));
  }

  Widget _buildFuture(BuildContext context) {
    Data data = new Data();
    return FutureBuilder(
        future: data.getTasks(data.dataList),
        initialData: data,
        builder: (context, snapshot) {
           if(data.dataValue != null) return MainList(
            dataName: data.dataName,
            dataValue: data.dataValue,
            dataCategory: data.dataCategory,
            dataDescription: data.dataDescription,
          );
          else
           return Text("Wow no tasks");
        });
  }

  Widget _mainBodyBuild(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title Placeholder"),
        actions: <Widget>[
          FlatButton(
            child: Text("Debug Delete"),
            onPressed: () {
              DatabaseMethods dbm = new DatabaseMethods();
              dbm.selectCategory("Casual Task");
              setState(() {
                _buildFuture(context);
              });
            },
          )
        ],
      ),
      body: _buildFuture(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ({
              Navigator.of(context)
                  .push<bool>(MaterialPageRoute(
                      builder: (BuildContext context) => (CreateTaskScreen())))
                  .then((bool value) {
                if (value) {
                  setState(() {
                    _mainBodyBuild(context);
                  });
                }
              })
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
      builder: (context) => _mainBodyBuild(context),
    ));
  }
}
