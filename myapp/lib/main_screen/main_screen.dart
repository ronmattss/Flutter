import 'package:flutter/material.dart';

import '../main_screen/main_list.dart';
import '../create_page/create_screen.dart';
import '../helper_classes/data.dart';
import '../main_screen/card_list.dart';
import 'package:myapp/helper_classes/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Data will be changed to a database entry
// A profile for the user, shows tasks number
// Change Model class
// CARD VIEW FOR EACH CATEGORY
// TODO: Preference Screen for options like name, categories, colors,
void main() {

  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  int counter = 0;
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final controller = PageController(initialPage: 0);
  ScrollController scrollController;
  @override
  void initState() {
    // print(data.dataList);
  }

  void testPref() async
  {
    List<String> test = new List<String>();
    final pref = await SharedPreferences.getInstance();
    int counter = (pref.getInt('counter')?? 0) + 1;
    await pref.setStringList("Category",test);
    print("pressed $counter times.");
    print(pref.getStringList("Category")?? "No Value");
    await pref.setInt('counter',counter);
  }

  void gotoCreateTaskPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => CreateTaskScreen()));
  }

  /*          Container(
            margin: EdgeInsets.all(5),
            height: 100,
            width: 100,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amberAccent,
            ),
          )*/

  Widget _buildProfile(BuildContext context) {
    //left side pic right side some task summaries
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 32.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(
                    Icons.account_circle,
                    size: 45.0,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
                  child: Text(
                    "Hello, Ron.",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ),
                Text(
                  "You have completed 10 tasks.",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "You have 3 Active tasks.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
          child: Text(
            "TODAY : JUL 21, 2018",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ));
  }

//Spacer(),Container(height: 100,margin: EdgeInsets.all(10),child: Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text("Number of Completed Tasks: 10\nNumber of Active Tasks: 5",)])
  Widget _buildFuture(BuildContext context) {
    Data data = new Data();
    return FutureBuilder(
        future: data.getTasks(data.dataList),
        initialData: data,
        builder: (context, snapshot) {
          if (data.dataValue != null) {
            widget.counter = data.dataList.length;
            return MainList(
              dataName: data.dataName,
              dataValue: data.dataValue,
              dataCategory: data.dataCategory,
              dataDescription: data.dataDescription,
            );
          } else
            return Text("Wow no tasks");
        });
  }

  Widget containerWithText(BuildContext context, String text) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('BUY TICKETS'),
                    onPressed: () {/* ... */},
                  ),
                  FlatButton(
                    child: const Text('LISTEN'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainBodyBuild(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          "TODO",
          style: TextStyle(fontSize: 16.0),
        ),
        backgroundColor: Colors.cyan,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: FlatButton(child: Text("hit me"),onPressed:testPref,),
          ),
        ],
        elevation: 0.0,
      ),
      drawer: Drawer(),
      body: Column(
        children: <Widget>[
          _buildProfile(context),
          SizedBox(
              height: 335,
              child:  CardList()),
        ],
      ),
      backgroundColor: Colors.cyan,

      floatingActionButton: FloatingActionButton(
        onPressed: () => ({
          Navigator.of(context)
              .push<bool>(MaterialPageRoute(
                  builder: (BuildContext context) => (CreateTaskScreen())))
              .then((bool value) {
            if (value) {
              setState(() {
                _mainBodyBuild(context);
                _buildFuture(context);
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
