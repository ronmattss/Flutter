import 'MockData.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:english_words/english_words.dart';

class MainList extends StatelessWidget {
  final List<String> dataName;
  final List<int> dataValue;
  MainList({@required this.dataName, @required this.dataValue});

  Widget _buildMockDataList(BuildContext context, int index) {
    return Card(
      child: MockData(
        sampleName: dataName[index],
        sampleValue: dataValue[index],
      ),
      color: Colors.lightBlue,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildMockDataList,
      itemCount: dataName.length,
    );
  }
}
