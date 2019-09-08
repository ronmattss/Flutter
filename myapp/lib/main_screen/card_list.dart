import 'package:myapp/helper_classes/crud.dart';

import 'MockData.dart';
import 'package:flutter/material.dart';
import 'package:myapp/helper_classes/category_enums.dart';

enum Category2{
  Garden,Home,School
}
class CardList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardListState();
  }
}

class _CardListState extends State<CardList> {
  // Cardview

  Widget _buildCard(BuildContext context, int index) {
    return GestureDetector(
        child: Padding(
            padding: EdgeInsets.all((8)),
            child: Card(margin: EdgeInsets.symmetric(horizontal: 50),color: Colors.amberAccent,
                child: SizedBox(
                  width: 150.0,
                  height: 150.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Icon category"),
                            Text("Icon Settings")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Text(
                                "Tasks remaining: $index",
                                style: TextStyle(color: Colors.cyan),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Text(
                                Category.values[index].toString().replaceAll("Category.", "").toUpperCase(),
                                style: TextStyle(fontSize: 28.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LinearProgressIndicator(
                                value: 90,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)))));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 350.0,
        child: SizedBox(width: 450,child: PageView.builder(
          itemCount: 3,
          itemBuilder: _buildCard,
          scrollDirection: Axis.horizontal,pageSnapping: true,
        )));
  }
}
