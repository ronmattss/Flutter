import 'package:apod_app/helper/APOD.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApodList extends StatefulWidget {
  final List<APOD> apods;
  ApodList({this.apods});
  @override
  State<StatefulWidget> createState() => _ApodListState();
}

class _ApodListState extends State<ApodList> with AutomaticKeepAliveClientMixin{
  Widget _cardBuild(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(child: Container(
        height: ((size.height / 2) - 20),
        width: size.width,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: widget.apods[index].hdurl != null
                ? CachedNetworkImage(
                  imageUrl: widget.apods[index].hdurl,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: size.width,
                  height: size.height / 2,
                  fit: BoxFit.cover,
                  color: Color.fromRGBO(0, 0, 0, .35),
                  colorBlendMode: BlendMode.darken,
                )
                : Placeholder())));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.apods.length,
      itemBuilder: _cardBuild,
     // gridDelegate:
     //     new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      addAutomaticKeepAlives: true,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
