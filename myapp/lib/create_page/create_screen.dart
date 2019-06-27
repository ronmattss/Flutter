//Create Task screen
// fields and shits
// another route from main then
import "package:flutter/material.dart";
import 'package:myapp/helper_classes/crud.dart';

//Instantiate Task class to access it's properties, it will be saved at the database after its implementation
// save to database then load it in the MainList
// needs category

class CreateTaskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  String task;
  String description;
  String category = "Uncategorized";
  DatabaseMethods dbm = new DatabaseMethods();


   //Database Entry Function


  void validateEntry() {
    if (task == null && description == null) {
      showDialog(
          builder: (BuildContext context) {
            return _alertDialog();
          },
          context: context);
    } else {
      dbm.insert(task, description, category);

      Navigator.pop(context, true);
    }
  }

  Widget _alertDialog() {
    return AlertDialog(
      title: Text("Please Enter something"),
      actions: <Widget>[
        FlatButton(
          child: Text("Ok"),
          onPressed: () => Navigator.pop(context, false),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Container(margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          // dk if it is appropriate or not
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            autofocus: false,
            autocorrect: false,
            onChanged: (String value) {
              setState(() {
                task = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: "Description"),
            autofocus: false,
            autocorrect: false,
            maxLines: 3,
            onChanged: (String value) {
              setState(() {
                description = value;
              });
            },
          ),
          DropdownButton<String>(
            onChanged: (String newValue) {
              setState(() {
                category = newValue;
              });
            },
            value: category,
            items: <String>["Uncategorized","Important", "Casual Task"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          FlatButton(
              child: Text("Save"),
              onPressed: () => ({
                    validateEntry() // can be replaced to any data type
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
            body: SingleChildScrollView(child:  _buildBody())));
  }
}
