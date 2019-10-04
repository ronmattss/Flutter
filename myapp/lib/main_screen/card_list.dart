import 'package:flutter/widgets.dart';
import 'package:myapp/helper_classes/crud.dart';
import 'package:myapp/helper_classes/preference_helper.dart';
import 'dart:math';
import 'MockData.dart';
import 'package:flutter/material.dart';
import 'package:myapp/helper_classes/category_enums.dart';
import 'package:palette_generator/palette_generator.dart';

enum Category2 { Garden, Home, School }

class CardList extends StatefulWidget {
  final List<String> cats;
  CardList(this.cats);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardListState();
  }
}

/*Image.network(
"https://picsum.photos/id/${images[index]}/700/?blur=2",
fit: BoxFit.cover,height: 400,color: Color.fromRGBO(0, 0, 0, .35),
colorBlendMode: BlendMode.darken,
)*/
class _CardListState extends State<CardList> {
  List<int> images = new List<int>();
  List<String> src = [
    "assets/first.jpg",
    "assets/second.jpg",
    "assets/third.jpg",
    "assets/fourth.jpg",
  ];
  List<Image> srcImage = new List<Image>();
  List<PaletteColor> colorList;
  int _colorIndex;
  // Cardview
  @override
  void initState() {
    _colorIndex = 0;
    images.add(119);
    images.add(149);
    images.add(0);
    images.add(1002);
    colorList = [];
    _updatePalettes();
  }

  _updatePalettes() async {
    for (String image in src) {
      final PaletteGenerator generator =
          await PaletteGenerator.fromImageProvider(AssetImage(image));
      colorList.add(generator.lightMutedColor != null
          ? generator.lightMutedColor
          : PaletteColor(Colors.blue, 2));
    }
  }

  Widget _buildCard(BuildContext context, int index) {
    return GestureDetector(
        child: Padding(
            padding: EdgeInsets.all((8)),
            child: Card(
                margin: EdgeInsets.symmetric(horizontal: 50),
                color: colorList.isNotEmpty
                    ? colorList[index].color
                    : Colors.amberAccent,
                child: SizedBox(
                  width: 150.0,
                  height: 150.0,
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            "https://picsum.photos/id/${images[index]}/700/?blur=2",
                            fit: BoxFit.cover,
                            height: 400,
                            color: Color.fromRGBO(0, 0, 0, .35),
                            colorBlendMode: BlendMode.darken,
                          )),
                      Column(
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
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  child: _buildCategoryText(index),
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
                      )
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)))));
  }

  Widget _buildCategoryText(int index) {
    return Text(
      widget.cats[index].toUpperCase(),
      style: TextStyle(fontSize: 28.0, color:colorList.isNotEmpty
          ? colorList[index].color
          : Colors.deepOrange),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 350.0,
        child: SizedBox(
            width: 450,
            child: PageView.builder(
              itemCount: widget.cats.length,
              itemBuilder: _buildCard,
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
            )));
  }
}
