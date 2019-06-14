import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'main_screen/main_list.dart';

void main() {
/*
  Data someData = new Data();
  someData.dataName.add(WordPair.random(maxSyllables: 10).asPascalCase);
  someData.dataValue.add(someData.dataName.length);
*/

  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  Data data = new Data();
  @override
  void initState() {
    super.initState();
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(onPressed: () {
      setState(() {
        data.dataName
            .add(WordPair.random(maxSyllables: 5).asPascalCase);
        data.dataValue.add(data.dataName.length);
      });
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Title Placeholder"),
        ),
        body: MainList(
          dataName: data.dataName,
          dataValue: data.dataValue,
        ),
        floatingActionButton: _floatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

class Data {
  List<String> dataName = <String>[];
  List<int> dataValue = <int>[];
}
