import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


//TODO Change this to StateFulWIdget so that on tap can
class MockData extends StatelessWidget {
  final String sampleName;
  final int sampleValue;

   MockData({
    this.sampleName,
    this.sampleValue,
  })  : assert(sampleValue != null),
        assert(sampleName != null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text("Name: $sampleName Value: $sampleValue"),padding: EdgeInsets.all(16.0),
    );
  }
}
