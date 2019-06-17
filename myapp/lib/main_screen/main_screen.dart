import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import '../main_screen/main_list.dart';
import '../create_page/create_screen.dart';
import '../helper_classes/data.dart';
import '../detail_page/detail_screen.dart';

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
  @override
  void initState() {
    print(widget.data.dataName);
    super.initState();
  }

  void gotoCreateTaskPage()
  {
     Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => CreateTaskScreen(widget.data,setTitle)));
  }

  void setTitle(String valueOfTitle)
  {
    title = valueOfTitle;
  }

  void addData()
  {
     widget. data.dataName.add(title);
     widget. data.dataValue.add(widget.data.dataName.length - 1);
  }

// This will be replaced to create a route to the createTaskScreen
  // Widget _floatingActionButton() {
  //   return FloatingActionButton(onPressed: () => gotoCreateTaskPage());
  // }
  Widget _mainBodyBuild(BuildContext context)
  {
   return Scaffold(
        appBar: AppBar(
          title: Text("Title Placeholder"),
        ),
        body: MainList(
          dataName: widget.data.dataName,
          dataValue: widget.data.dataValue,
        ),
        floatingActionButton: FloatingActionButton(onPressed:() => ({
               Navigator.of(context).push<bool>(
        MaterialPageRoute(
            builder: (BuildContext context) => (CreateTaskScreen(widget.data,setTitle)))).then((bool value)
            {
              if(value)
              {
                addData();
                print(widget.data.dataName.length);                
                _mainBodyBuild(context);
                print("TANGA ito na title mo: " + widget.data.dataName[widget.data.dataName.length-1]);
              }
            })
        }),),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home:Builder(builder: (context) => _mainBodyBuild(context),)
    );
  }
}




// /**{
//       setState(() {
//         data.dataName
//             .add(WordPair.random(maxSyllables: 5).asPascalCase);
//         data.dataValue.add(data.dataName.length -1);
//         MainList(dataName: data.dataName,dataValue: data.dataValue);
//       });
//     } *//