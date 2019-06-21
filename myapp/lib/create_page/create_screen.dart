//Create Task screen
// fields and shits
// another route from main then
import "package:flutter/material.dart";

//Instantiate Task class to access it's properties, it will be saved at the database after its implementation
// save to database then load it in the MainList
// needs category

class CreateTaskScreen extends StatefulWidget {
  final Function addData;
  CreateTaskScreen(this.addData);
  @override
  State<StatefulWidget> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  String titleValue;
  String descriptionValue;
  String category = "Uncategorized";

  void validateEntry() {
    if (titleValue == null && descriptionValue == null) {
      showDialog(
          builder: (BuildContext context) {
            return _alertDialog();
          },
          context: context);
    } else {
      widget.addData(titleValue, descriptionValue,category);
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
                titleValue = value;
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
                descriptionValue = value;
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
            body: _buildBody()));
  }
}
