//Create Task screen
// fields and shits
// another route from main then
import 'dart:core';

import "package:flutter/material.dart";
import 'package:myapp/helper_classes/crud.dart';
import 'package:myapp/helper_classes/preference_helper.dart';

//Instantiate Task class to access it's properties, it will be saved at the database after its implementation
// save to database then load it in the MainList
// needs category

class CreateTaskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
 List<DropdownMenuItem<String>> listOfCategories;
 String selectedCategery;
  String task;
  String description;
  String category = "Uncategorized";
  DatabaseMethods dbm = new DatabaseMethods();


   //Database Entry Function
List<DropdownMenuItem<String>> buildCategoryList(List categories)
{
  List<DropdownMenuItem<String>> items = List();
  for(String string in categories)
    {
      items.add(DropdownMenuItem(value: string,child: Text(string),),);
    }
  return items;
}

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

  onChangeDropdownItem(String selectedCategory) {
    setState(() {
      category = selectedCategory;
    });
  }

  @override
  void initState(){
  listOfCategories =buildCategoryList(PreferenceHelper.cat);
  print(listOfCategories[0]);
  category = listOfCategories[0].value;
  }

  Widget _buildBody() {
    print("some categories: ${PreferenceHelper.cat}");

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
          DropdownButton(
            onChanged: onChangeDropdownItem,
            value: category,
            items: listOfCategories,
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
