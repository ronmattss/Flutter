import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_info_system/Models/Profile.dart';

class MainPage extends StatefulWidget {
  final Profile profile;

  MainPage(this.profile);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

DecorationImage _buildBackgroundImage() {
  return DecorationImage(
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage("assets/puplogo.jpg"));
}

class _MainPageState extends State<MainPage> {
  Widget _buildProfile(BuildContext context) {
    //left side pic right side some task summaries
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 64.0),
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

  Widget _buildBody(BuildContext context) {
    return Container(
        decoration: BoxDecoration(image: _buildBackgroundImage()),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Center(
          child: Column(children: <Widget>[
            Text(widget.profile.studentId),
            Text(widget.profile.name),
            Text(widget.profile.course),
            Text(widget.profile.age.toString()),
          ]),
          // Text(widget.profile.studentId)
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(128, 0, 0, 1),
            bottom: TabBar(
              indicatorColor: Color.fromRGBO(254, 222, 0, 1),
              tabs: <Widget>[
                Tab(text: "Profile"),
                Tab(text: "Grades"),
              ],
            ),
            title: Text("Polytechnic University of the Philippines"),
          ),
          body: TabBarView(
            children: <Widget>[
              _buildBody(context),
              Container(
                  decoration: BoxDecoration(image: _buildBackgroundImage()),
                  child: Center(child: (Text("Coming Soon!",style: TextStyle(fontSize: 50.0,color: Color.fromRGBO(128, 0, 0, 1)),)))),
            ],
          ),
        ),
      ),
    );
  }
}
