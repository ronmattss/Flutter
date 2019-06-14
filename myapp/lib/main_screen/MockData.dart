import 'package:flutter/material.dart';
import 'package:myapp/detail_page/detail_screen.dart';

//TODO Change this to StateFulWIdget so that on tap can
// this should have a setState() Function
class MockData extends StatelessWidget {
  final String sampleName;
  final int sampleValue;

  MockData({
    this.sampleName,
    this.sampleValue,
  })  : assert(sampleValue != null),
        assert(sampleName != null);

  void gotoDetailScreen(BuildContext context) {
    Navigator.push( context, MaterialPageRoute(builder: (BuildContext context) => DetailScreen(sampleName)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        type: MaterialType.transparency,
        child: GestureDetector(
            onTap: () => ({gotoDetailScreen(context)}),
            child: Container(
              color: Colors.red,
              child: Column(
                children: <Widget>[
                  Text("Name: $sampleName Value: $sampleValue"),
                ],
              ),
              padding: EdgeInsets.all(16.0),
            )));
  }
}
