//Create Task screen
// fields and shits
// another route from main then
import "package:flutter/material.dart";

import "package:myapp/helper_classes/data.dart";
import 'package:myapp/main_screen/main_screen.dart';

//Instantiate Task class to access it's properties, it will be saved at the database after its implementation
// save to database then load it in the MainList

class CreateTaskScreen extends StatefulWidget {
  final Data data;
  final Function addData;
  CreateTaskScreen(this.data,this.addData);
  @override
  State<StatefulWidget> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  String titleValue;
  String descriptionValue;

  Widget _buildBody() {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Title Field Placeholder"), // dk if it is appropriate or not
          TextField(
            decoration: InputDecoration(helperText: "Title"),
            autofocus: false,
            autocorrect: false,
          ),
          Text("Description Field Placeholder"),
          TextField(
            decoration: InputDecoration(helperText: "Title"),
            autofocus: false,
            autocorrect: false,
            maxLines: 5,
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ),
          FlatButton(
              child: Text("Save"),
              onPressed: () => ({
                    print(titleValue),
                    widget.addData(titleValue),
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MainScreen()),result: true)
                  }))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text("Create Task"),
            ),
            body: _buildBody()));
  }
}
