import 'package:date_format/date_format.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../helper/APOD.dart';

class RestRequest {
  var currentDate = new DateTime.now();
  String apiKey = "QQ4hid7sklYYzkTcC3fPDyQ3W0253Fe8e9mpyMEC";
  String date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]).toString();

//TODO: Should it be a client or not
  Future<APOD> requestAPOD() async {
    String url =
        "https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$date";
    print("Date:$date");
    var response = await http.get(url);
    String responseBody = response.body;

    if (response.statusCode == 200) {
      Map apodMap = jsonDecode(responseBody);
      APOD apod = new APOD.fromJson(apodMap);
      print("Response Status: ${response.statusCode}");
      print("Response Body: $responseBody");
      return apod;
    } else {
      String prevDate = formatDate(DateTime.now().subtract(new Duration(days: 1)), [yyyy, '-', mm, '-', dd]);
      String prevUrl =  "https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$prevDate";
      response = await http.get(prevUrl);
      String prevResponseBody = response.body;
          if (response.statusCode == 200) {
      Map apodMap = jsonDecode(prevResponseBody);
      APOD apod = new APOD.fromJson(apodMap);
      print("Response Status: ${response.statusCode}");
      print("Response Body: $responseBody");
      return apod;
    }else{
      throw Exception("no APOD AVAILABLE");
    }
    }
  }
  static void testDates()
  {
    for (int i = 1; i<=10; i++)
    {
      print(DateTime.now().subtract(new Duration(days: i)));
    }
  }

  Future<List<APOD>> requestTenAPOD() async{
    int duration = 10;
    List<APOD> tenPhotos = new List<APOD>();
    String url = "https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$date";
    for(int i = 1; i <= duration;i++)
    { String previousDays = formatDate(DateTime.now().subtract(new Duration(days: i)), [yyyy, '-', mm, '-', dd]);
     String url = "https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$previousDays"; 
 
     var response = await http.get(url);
     if(response.statusCode == 200)
     {
       Map apodMapList = jsonDecode(response.body);
       tenPhotos.add(new APOD.fromJson(apodMapList));
       print(tenPhotos.last.date);
     }
    }
    return tenPhotos;
    
  }
}
