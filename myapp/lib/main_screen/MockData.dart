import 'package:flutter/material.dart';
import 'package:myapp/detail_page/detail_screen.dart';
import 'package:myapp/helper_classes/crud.dart';


class MockData extends StatelessWidget {
  final String sampleName;
  final String sampleDescription;
  final String sampleCategory;
  final int sampleValue;
  final Function sampleDelete;

  MockData({
    this.sampleName,
    this.sampleDescription,
    this.sampleValue,
    this.sampleCategory,
    this.sampleDelete});
  // })  : assert(sampleValue != null),
  //       assert(sampleName != null),
  //       assert(sampleDescription != null),
  //       assert(sampleCategory != null),
  //       assert(sampleDelete != null);

  void gotoDetailScreen(BuildContext context, String dataTitle,String dataDescription,String dataCategory, int dataId) {
    DatabaseMethods dbm = new DatabaseMethods();
    Navigator.push<bool>(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                DetailScreen(dataTitle,dataDescription,dataCategory, dataId))).then((bool value) {
      if (value) {
        print(dataId);
        sampleDelete(dataId); 
        dbm.deleteRow(dataId);
        build(context);        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: GestureDetector(
            onTap: () => gotoDetailScreen(context, sampleName,sampleDescription,sampleCategory, sampleValue),
            child: Container(
              color: Colors.blueAccent,
              child: Column(
                children: <Widget>[
                  Text("ID:$sampleValue Title: $sampleName Description: $sampleDescription"),
                ],
              ),
              padding: EdgeInsets.all(16.0),
            )));
  }
}
