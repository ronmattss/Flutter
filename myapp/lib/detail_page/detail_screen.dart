import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

//What is this page?
// This page will contatin the details about the task you need/want to do
// basic example contains description, Title, task, priority...

//task class will hold the data
//task class should retrieve ID from database based on the given string or int id which in return will be displayed on the screen
// database will hold id title description icon color (or whatever)
// should make a delete button and save button
// Detail screen should contain an edit button

class DetailScreen extends StatelessWidget {
  final String task;
  final String description;
  final String category;
  final int taskId;

  DetailScreen(this.task,this.description,this.category,this.taskId);

  // builds
  Widget _buildAppBar() {
    return AppBar(
      title: Text(task + " " + category),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Description"),
        Text(description),
        Container(child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("Delete"),
              onPressed: () => {
                Navigator.pop(context,true)
              },
            ),
            FlatButton(
              child: Text("Diznt Nutz"),
              onPressed: () => {},
            )
          ],
        )))
      ],
    );
  }

  //the build method
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(
            context, false); // return false for use in .then() statement
        return Future.value(
            false); //  manual backing for the back button software/hardware
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context),
      ),
    );
  }
}
