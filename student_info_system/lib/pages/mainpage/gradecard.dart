import 'package:flutter/material.dart';
import 'package:student_info_system/Models/Grades.dart';
import 'package:student_info_system/Models/custom_expansion_title.dart'
    as custom;
import 'package:student_info_system/Models/subbed_expansion.dart' as cus;

class GradeCard extends StatelessWidget {
  final Grades grades;

  GradeCard(this.grades);

  Widget _buildListTile(BuildContext context, int index) {
    List<String> s = grades.subjects();
    List<String> ss = grades.subjectCodes();
    return ListTile(
      contentPadding: EdgeInsets.all(5),
      title: Text(s[index]),
    );
  }

  Widget _buildExpansionTile(BuildContext context) {
    return cus.ExpansionSubTitledTile(
        subtitle: Text("Second Year First Semester"),
        initiallyExpanded: false,
        backgroundColor: Colors.white,
        // Color.fromRGBO(218, 164, 32, 1.0)
        title: Text(
          "GPA",
          style: TextStyle(color: Colors.black),
        ),
        trailing: Text(grades.average().toString()),
        children: <Widget>[
          Container(
            height: 350,
            child: CustomScrollView(slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ListTile(
                    title: Text(grades.subjects()[index]),
                    subtitle: Text(grades.subjectCodes()[index]),
                    trailing: Text((grades.grades()[index]).toString()),
                  );
                }, childCount: grades.subjects().length),
              )
            ]),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildExpansionTile(context);
  }
}
