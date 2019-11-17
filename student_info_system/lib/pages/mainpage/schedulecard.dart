import 'package:flutter/material.dart';
import 'package:student_info_system/Models/Grades.dart';
import 'package:student_info_system/Models/custom_expansion_title.dart'
    as custom;
import 'package:student_info_system/Models/subbed_expansion.dart' as cus;

class ScheduleCard extends StatelessWidget {
  ScheduleCard();

  Widget _buildTuesdayTile(BuildContext context) {
    Grades grades = new Grades();
    List<String> subs = grades.subjects();
    return cus.ExpansionSubTitledTile(
        initiallyExpanded: false,
        backgroundColor: Colors.white,
        // Color.fromRGBO(218, 164, 32, 1.0)
        title: Text(
          "Tuesday",
          style: TextStyle(color: Colors.black),
        ),
        children: <Widget>[
          Container(
            height: 350,
            child: CustomScrollView(slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildtitle(context, subs[2], "07:30 AM - 10:30 AM", "S510"),
                  _buildtitle(context, subs[0], "11:30 AM - 01:30 PM", "E413"),
                  _buildtitle(context, subs[4], "03:00 PM - 04:30 PM", "E511"),
                  _buildtitle(context, subs[1], "04:30 PM - 06:00 PM", "E513"),
                ]),
              )
            ]),
          )
        ]);
  }

  Widget _buildWednesdayTile(BuildContext context) {
    Grades grades = new Grades();
    List<String> subs = grades.subjects();
    return cus.ExpansionSubTitledTile(
        initiallyExpanded: false,
        backgroundColor: Colors.white,
        // Color.fromRGBO(218, 164, 32, 1.0)
        title: Text(
          "Wednesday",
          style: TextStyle(color: Colors.black),
        ),
        children: <Widget>[
          Container(
            height: 350,
            child: CustomScrollView(slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildtitle(context, subs[3], "09:00 AM - 12:00 AM", "E409"),
                  _buildtitle(context, subs[6], "12:00 PM - 03:00 PM", "W510"),
                  _buildtitle(context, subs[5], "03:00 PM - 06:00 PM", "E413"),
                ]),
              )
            ]),
          )
        ]);
  }

  Widget _buildFridayTile(BuildContext context) {
    Grades grades = new Grades();
    List<String> subs = grades.subjects();
    return cus.ExpansionSubTitledTile(
        initiallyExpanded: false,
        backgroundColor: Colors.white,
        // Color.fromRGBO(218, 164, 32, 1.0)
        title: Text(
          "Friday",
          style: TextStyle(color: Colors.black),
        ),
        children: <Widget>[
          Container(
            height: 350,
            child: CustomScrollView(slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildtitle(context, subs[2], "07:30 AM - 09:30 AM", "E411"),
                  _buildtitle(context, subs[0], "10:30 AM - 01:30 PM", "S502"),
                  _buildtitle(context, subs[4], "03:00 PM - 04:30 PM", "E511"),
                  _buildtitle(context, subs[1], "04:30 PM - 06:00 PM", "E513"),
                ]),
              )
            ]),
          )
        ]);
  }

  /*  List<String> subs = new List<String>();
  subs.add("Data Structures and Algorithms");
  subs.add("Discrete Structures");
  subs.add("Object Oriented Programming");
  subs.add("Modelling and Simulation");
  subs.add("Logic Design");
  subs.add("CS Free Elective");
  subs.add("Ethics");
  subs.add("World Literature");
  subs.add("Physical Education");*/

  Widget _buildSaturdayTile(BuildContext context) {
    Grades grades = new Grades();
    List<String> subs = grades.subjects();
    return cus.ExpansionSubTitledTile(
        initiallyExpanded: false,
        backgroundColor: Colors.white,
        // Color.fromRGBO(218, 164, 32, 1.0)
        title: Text(
          "Saturday",
          style: TextStyle(color: Colors.black),
        ),
        children: <Widget>[
          Container(
            height: 350,
            child: CustomScrollView(slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildtitle(context, subs[8], "10:00 AM - 12:00 PM", "S510"),
                  _buildtitle(context, subs[7], "04:30 PM - 07:30 PM", "E413"),
                ]),
              )
            ]),
          )
        ]);
  }

  Widget _buildtitle(
      BuildContext context, String sub, String schedule, String room) {
    return ListTile(
      title: Text(sub),
      subtitle: Text(schedule),
      trailing: Text(room),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        _buildTuesdayTile(context),
        _buildWednesdayTile(context),
        _buildFridayTile(context),
        _buildSaturdayTile(context)
      ],
    );
  }
}
