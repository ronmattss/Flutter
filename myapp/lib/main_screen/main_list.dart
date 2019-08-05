import 'MockData.dart';
import 'package:flutter/material.dart';
import 'package:myapp/helper_classes/data.dart';

// I think we can call the data Class here
// I want a profile for the user, locally saved first :)
class MainList extends StatefulWidget {
  final List<String> dataName;
  final List<String> dataDescription;
  final List<String> dataCategory;
  final List<int> dataValue;

  MainList(
      {@required this.dataName,
      @required this.dataDescription,
      @required this.dataCategory,
      @required this.dataValue});
  @override
  State<StatefulWidget> createState() {
    return _MainListState();
  }
}

class _MainListState extends State<MainList> {
  // A prototype deleteData which has redundant code
  void deleteData(int index) {
    if (index == widget.dataName.length) {
      widget.dataName.removeAt(index - 1);
      widget.dataValue.removeAt(index - 1);
      widget.dataDescription.removeAt(index - 1);
      widget.dataCategory.removeAt(index - 1);
    } else if (index < 0) {
      widget.dataName.removeAt(0);
      widget.dataValue.removeAt(0);
      widget.dataDescription.removeAt(0);
      widget.dataCategory.removeAt(0);
    } else {
      widget.dataName.removeAt(index);
      widget.dataValue.removeAt(index);
      widget.dataDescription.removeAt(index);
      widget.dataCategory.removeAt(index);
    }
    for (var i = 0; i < widget.dataName.length; i++) {
      widget.dataValue[i] = i;
    }

    build(context);
  }

  Widget _buildMockDataList(BuildContext context, int index) {
    return Card(
      child: MockData(                  // this will be replaced by data on a local database
        sampleName: widget.dataName[index],
        sampleValue: widget.dataValue[index],
        sampleDescription: widget.dataDescription[index],
        sampleCategory: widget.dataCategory[index],
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
      itemCount: widget.dataName.length,shrinkWrap: true,
    );
  }
}
