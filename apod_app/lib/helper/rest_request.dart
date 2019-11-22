import 'dart:io';
import 'dart:typed_data';

import 'package:date_format/date_format.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../helper/APOD.dart';

class RestRequest {
  var currentDate = new DateTime.now();

  String apiKey = "QQ4hid7sklYYzkTcC3fPDyQ3W0253Fe8e9mpyMEC";
  String date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]).toString();
  String cacheURI = "LatestApod";

  Future<http.Response> getApod(String url) async {
    try {
      return await http.get(url);
    } catch (e) {
      print("no internet I think");
      return null;
    }
  }
  


//TODO: Should it be a client or not
  Future<APOD> requestAPOD() async {
    String url =
        "https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$date";
    print("Date:$date");
    var response = await getApod(url);
    if (response != null) {
      String responseBody = response.body;
      if (response.statusCode == 200) {
        List<int> stringLength = utf8.encode(responseBody);
        Uint8List byteSize = stringLength;
        var cachedJSON = await DefaultCacheManager().putFile(
            responseBody, byteSize,
            fileExtension: ".json", eTag: cacheURI);
        var x = await cachedJSON.readAsString();
        print('Caching: $x');
        var y = DefaultCacheManager().getFileFromCache(cacheURI);
        
        print("Experimenting: ${y.asStream().last}");
        
        print("Trying to read from cache$z");
        Map apodMap = jsonDecode(responseBody);
        APOD apod = new APOD.fromJson(apodMap);
        print("Response Status: ${response.statusCode}");
        print("Response Body: $responseBody");
        return apod;
      } else {
        var cachedLatestAPOD =
            await DefaultCacheManager().getSingleFile(responseBody);
        if (cachedLatestAPOD != null) {
          var cachedInfo = await cachedLatestAPOD.readAsString();
          Map cachedMap = jsonDecode(cachedInfo);
          APOD apod = new APOD.fromJson(cachedMap);
          print('From Cached data ${apod.explanation}');
          return apod;
        } else {
          throw Exception("NO APOD AVAILABLE");
        }
      }
    } else {
      var cachedAPOD = await DefaultCacheManager().getSingleFile(cacheURI);
      var x = await cachedAPOD.readAsString();
      print(x);
      return APOD();
    }
  }

  static void testDates() {
    for (int i = 1; i <= 10; i++) {
      print(DateTime.now().subtract(new Duration(days: i)));
    }
  }

  Future<List<APOD>> requestTenAPOD() async {
    int duration = 10;
    List<APOD> tenPhotos = new List<APOD>();
    for (int i = 1; i <= duration; i++) {
      String previousDays = formatDate(
          DateTime.now().subtract(new Duration(days: i)),
          [yyyy, '-', mm, '-', dd]);
      String url =
          "https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$previousDays";

      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map apodMapList = jsonDecode(response.body);
        tenPhotos.add(new APOD.fromJson(apodMapList));
        print(tenPhotos.last.date);
      } else {
        continue;
      }
    }
    return tenPhotos;
  }
}
