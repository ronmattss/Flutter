import 'package:flutter/material.dart';
import 'package:myapp/detail_page/detail_screen.dart';

//TODO Change this to StateFulWIdget so that on tap can
// this should have a setState() Function
class MockData extends StatelessWidget {
  final String sampleName;
  final int sampleValue;
  final Function sampleDelete;

  MockData({
    this.sampleName,
    this.sampleValue,
    this.sampleDelete,
  })  : assert(sampleValue != null),
        assert(sampleName != null),
        assert(sampleDelete != null);

  void gotoDetailScreen(BuildContext context, String dataTitle, int dataId) {
    Navigator.push<bool>(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                DetailScreen(dataTitle, dataId))).then((bool value) {
      if (value) {
        print(dataId);
        sampleDelete(dataId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        type: MaterialType.transparency,
        child: GestureDetector(
            onTap: () => gotoDetailScreen(context, sampleName, sampleValue),
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
