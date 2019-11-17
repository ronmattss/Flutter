import 'package:apod_app/helper/APOD.dart';
import 'package:flutter/cupertino.dart';

class ApodList extends StatefulWidget {
  final List<APOD> apods;
  ApodList({this.apods});
  @override
  State<StatefulWidget> createState() => _ApodListState();
}

class _ApodListState extends State<ApodList> {
  Widget _cardBuild(BuildContext context, int index) {
        Size size = MediaQuery.of(context).size;
    return Container(height: ((size.height /2) - 20),width: size.width,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              widget.apods[index].hdurl,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              color: Color.fromRGBO(0, 0, 0, .35),
              colorBlendMode: BlendMode.darken,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.apods.length,
      itemBuilder: _cardBuild,

    );
  }
}