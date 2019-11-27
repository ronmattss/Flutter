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

// Caching works somehow
// TODO: Clean this shit
// Seperate the functions which can be broken down
  String updateURL(String date) {
    String updatedURL =
        "https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$date";
    return updatedURL;
  }

  APOD constructAPOD(String jsonString) {
    Map apodMap = jsonDecode(jsonString);
    APOD apod = new APOD.fromJson(apodMap);
    return apod;
  }

  Future constructPrevAPOD() async {
    date = formatDate(DateTime.now().subtract(new Duration(days: 1)),
        [yyyy, '-', mm, '-', dd]);
    var cachedApod =
        await DefaultCacheManager().getFileFromCache(updateURL(date));
    var stringApod = await cachedApod.file.readAsString();
    APOD apod = constructAPOD(stringApod);
    return apod;
  }

  Future<http.Response> getApod(String url) async {
    try {
      return await http.get(url);
    } catch (e) {
      print("Internet not Available");
      return null;
    }
  }

// this first needs to check if there is a cached data in the given date
// if there is none, fetch new data from NASA
//TODO: cached previous date if today is not available
  Future<APOD> requestAPOD() async {
    String url = updateURL(date);
    var getPhotoData = await DefaultCacheManager().getFileFromCache(url);
    APOD returningApod;

    if (getPhotoData == null) {
      //HTTP Request
      var response = await getApod(url);
      if (response != null) {
        String responseBody = response.body;
        if (response.statusCode == 200) // means ok Data is captured
        {
          var cached = await DefaultCacheManager()
              .downloadFile(url); // download the files
          //Show where the cache is being stored for debugging purposes
          print('Cache Path: ${cached.file.path}');
          APOD apod = constructAPOD(responseBody);
          returningApod = apod;
        } else {
          APOD apod = await constructPrevAPOD();
          returningApod = apod;
        }
      }
    } else if (getPhotoData != null) {
      String photoString = await getPhotoData.file.readAsString();
      APOD apod = constructAPOD(photoString);
      returningApod = apod;
    } else {
      returningApod = null;
    }
    return returningApod;
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
      String url = updateURL(previousDays);
      // check cached Data if anything is stored
      // else retrieve from NASA
      var cachedData = await DefaultCacheManager().getFileFromCache(url);

      if (cachedData == null) {
        var response = await getApod(url);
        if (response.statusCode == 200) {
          DefaultCacheManager().downloadFile(url);
          tenPhotos.add(constructAPOD(response.body));
          print(tenPhotos.last.date);
        } else {
          continue;
        }
      } else if (cachedData != null) {
        print("Loading from cache: $i");
        String cachedJSON = await cachedData.file.readAsString();
        tenPhotos.add(constructAPOD(cachedJSON));
      }
    }
    return tenPhotos;
  }
}
