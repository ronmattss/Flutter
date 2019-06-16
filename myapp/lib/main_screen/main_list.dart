import 'MockData.dart';
import 'package:flutter/material.dart';
import 'package:myapp/detail_page/detail_screen.dart';

class MainList extends StatefulWidget {
  final List<String> dataName;
  final List<int> dataValue;
  MainList({@required this.dataName, @required this.dataValue});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainListState();
  }
}

class _MainListState extends State<MainList> {
  void deleteData(int index) {
   if(index == widget.dataName.length)
   {
      widget.dataName.removeAt(index -1);
      widget.dataValue.removeAt(index -1); 
   }
   else if (index < 0) {
      widget.dataName.removeAt(0);
      widget.dataValue.removeAt(0);
    } else {
      widget.dataName.removeAt(index);
      widget.dataValue.removeAt(index);
    }
    for (var i = 0; i < widget.dataName.length; i++) {
      widget.dataValue[i] = i;
    }

    build(context);
  }

  Widget _buildMockDataList(BuildContext context, int index) {
    return Card(
      child: MockData(
        sampleName: widget.dataName[index],
        sampleValue: widget.dataValue[index],
        sampleDelete: deleteData,
      ),
      color: Colors.lightBlue,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildMockDataList,
      itemCount: widget.dataName.length,
    );
  }
}
