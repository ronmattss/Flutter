import 'package:apod_app/helper/APOD.dart';
import 'package:apod_app/helper/rest_request.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoCard extends StatefulWidget {
  final Future<APOD> apod;
  PhotoCard({@required this.apod});
  @override
  State<StatefulWidget> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  APOD apod;
  RestRequest rr = new RestRequest();
  //3 Widgets
  // Main Photo
  // Card
//request apod on initState then build cards
  @override
  void initState() {
    super.initState();
    rr.requestAPOD().then((onValue) {
      apod = onValue;
      print(apod.title);
    });
  }

  Widget _buildPhotoCard(BuildContext context, String imageUrl) {
    Size size = MediaQuery.of(context).size;
    return imageUrl != null
        ? SizedBox(
            width: size.width,
            height: 200,
            child: Card(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
              ),
            ))
        : SizedBox(
            width: size.width,
            height: 200,
            child: Text("Image not Available"),
          );
  }

  @override
  Widget build(BuildContext context) {
    // Build Method
    return null;
  }
}
