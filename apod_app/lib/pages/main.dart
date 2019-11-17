import 'package:apod_app/helper/APOD.dart';
import 'package:apod_app/helper/rest_request.dart';
import 'package:apod_app/widgets/apod_list.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

void main() {
  print(DateTime.now());
  runApp(MainScreen());
}
// Main APOD
// Fav APOD at bottom
// List of APODs

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  Future<APOD> apod;
  Future<List<APOD>> apodList;
  APOD request;
  RestRequest rr = new RestRequest();

  final controller = PageController(initialPage: 0);
  ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    RestRequest.testDates();
    apod = rr.requestAPOD();
    apodList = rr.requestTenAPOD();
  }

  // Future builder that will request data from APOD
  Widget _buildApod(BuildContext context) {
    return FutureBuilder<APOD>(
      future: apod,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.hdurl == null) {
            return Center(
              child: Text("There is no APOD today"),
            );
          } else
            return _buildCard(context, snapshot.data);
        } else if (snapshot.hasError) {
          return (Center(child: Text("APOD not available, Check later")));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildAPODList(BuildContext context) {
    return FutureBuilder<List<APOD>>(
      future: apodList,
      builder: (context, snapshot) 
      { if(snapshot.hasData == true)
      {
        return Expanded(child:ApodList(apods: snapshot.data));
      }
      else{
        return Text("No apods");
      }
      },
    );
  }

// Main card that displays the photo
  Widget _buildCard(BuildContext context, APOD pod) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Card(
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  pod.hdurl,
                  width: size.width ,
                  height: size.height / 2,
                  fit: BoxFit.cover,
                  color: Color.fromRGBO(0, 0, 0, .35),
                  colorBlendMode: BlendMode.darken,
                )),

          ],
        ),
      ),
    ));
  }

  Widget _mainBodyBuild(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: new Text(
            "Astronomy Photo of the Day",
            style: TextStyle(fontSize: 16.0),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Choose Date"),
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2010, 1, 1),
                    maxTime: DateTime.now(), onConfirm: (date) {
                  rr.date =
                      formatDate(date, [yyyy, '-', mm, '-', dd]).toString();
                  setState(() {
                    print(rr.date);
                    apod = rr.requestAPOD();
                    _buildApod(context);
                  });
                });
              },
            )
          ],
          backgroundColor: Colors.cyan,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              _buildApod(context),
              _buildAPODList(context)
              // SizedBox(height: 300, child: _buildCardFuture(context)),
            ],
          ),
        ]));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
      builder: (context) => _mainBodyBuild(context),
    ));
  }
}
/*         Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              child: Text(
                        pod.title,
                        style: TextStyle(color: Colors.white),
                      ))),
                      Text(pod.date, style: TextStyle(color: Colors.white))
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
                            horizontal: 8.0, vertical: 90.0),
                        child: Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 90.0),
                        child: Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: SingleChildScrollView(
                            child: Text(
                              pod.explanation,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )*/