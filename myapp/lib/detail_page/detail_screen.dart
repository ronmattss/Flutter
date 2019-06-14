import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

//What is this page?
// This page will contatin the details about the task you need/want to do
// basic example contains description, Title, task, priority...

//task class will hold the data
//task class should retrieve ID from database based on the given string or int id which in return will be displayed on the screen

class DetailScreen extends StatelessWidget {

  final String task;


  DetailScreen(this.task);
   


  // builds
  Widget _buildAppBar() {
    return AppBar(
      title: Text(task),
    );
  }


  Widget _buildBody() {
    return Column( children: <Widget>[Text("A random word: "+ WordPair.random(maxSyllables: 20).asPascalCase),Card()],);
  }

  //the build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
