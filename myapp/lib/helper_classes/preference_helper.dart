import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static List<String> cat;

  static void setIntPreference(String key, int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt(key, value);
  }

  static void setBoolPreference(String key, bool value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(key, value);
  }

  static void setStringPreference(String key, String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(key, value);
  }

  static void setStringListPreference(String key, List<String> value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList(key, value);
  }

  static Future<int> _getIntPreference(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return  Future.delayed(Duration(seconds: 1),()=>pref.getInt(key));
  }

  static Future<bool> _getBoolPreference(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return Future.delayed(Duration(seconds: 1),()=>pref.getBool(key));
  }

  static Future<String> _getStringPreference(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return Future.delayed(Duration(seconds: 1),()=>pref.getString(key));
  }

  static Future<List<String>> _getStringListPreference(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    
    return Future.delayed(Duration(seconds: 1),()=>pref.getStringList(key));
  }

  static Future<int> getPreferenceInt(String key) async {
    var val = await _getIntPreference(key);
    print(val);
    return val;
  }

  static Future<bool> getPreferenceBool(String key) async {
    var val = await _getBoolPreference(key);
    print(val);
    return val;
  }

  static Future<String> getPreferenceString(String key) async {
    var val = await _getStringPreference(key);
    print(val);
    return val;
  }

  static Future<List<String>> getPreferenceStringList(String key) async {
    var val = await _getStringListPreference(key);
    print(val);
    return val;
  }

  static Future setCategory() async
  {

    cat = await PreferenceHelper.getPreferenceStringList("Category");
    if(cat == null)
    {
      print("cat is empty");
      List<String> categories = List<String>();
      categories.add("Home");
      categories.add("School");
      categories.add("Work");
      categories.add("Others");
      PreferenceHelper.setStringListPreference("Category",categories);
      cat = await PreferenceHelper.getPreferenceStringList("Category");
    }
    else
    {
      print("Cat is not empty");
      print(cat);
    }
    print(cat.length);
  }

 static void testPrint()
  {
    print("BOBOBOBOBO$cat");
  }


}
