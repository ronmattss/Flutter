import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import '../main_screen/main_list.dart';
import '../create_page/create_screen.dart';
import '../helper_classes/data.dart';
import '../detail_page/detail_screen.dart';

// Data will be changed to a database entry
// A profile for the user to

void main() {
/*
  Data someData = new Data();
  someData.dataName.add(WordPair.random(maxSyllables: 10).asPascalCase);
  someData.dataValue.add(someData.dataName.length);
*/

  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  final Data data = new Data();
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  String title;
  String description;
  String category;
  @override
  void initState() {
    print(widget.data.dataName);
    super.initState();
  }

  void gotoCreateTaskPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                CreateTaskScreen(setTitleDescription)));
  }

  void setTitleDescription(
      String valueOfTitle, String valueOfDescription, String valueOfCategory) {
    title = valueOfTitle;
    description = valueOfDescription;
    category = valueOfCategory;
  }

  void addData() {
    widget.data.dataName.add(title);
    widget.data.dataDescription.add(description);
    widget.data.dataCategory.add(category);
    widget.data.dataValue.add(widget.data.dataName.length - 1);
  }

// This will be replaced to create a route to the createTaskScreen
  // Widget _floatingActionButton() {
  //   return FloatingActionButton(onPressed: () => gotoCreateTaskPage());
  // }
  Widget _mainBodyBuild(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title Placeholder"),
      ),
      body: MainList(
        dataName: widget.data.dataName,
        dataValue: widget.data.dataValue,
        dataCategory: widget.data.dataCategory,
        dataDescription: widget.data.dataDescription,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ({
              Navigator.of(context)
                  .push<bool>(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          (CreateTaskScreen(setTitleDescription))))
                  .then((bool value) {
                if (value) {
                  addData();
                  print(widget.data.dataName.length);
                  _mainBodyBuild(context);
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
