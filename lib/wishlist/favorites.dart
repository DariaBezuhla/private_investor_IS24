import 'package:shared_preferences/shared_preferences.dart';

class Favorites {
  //for favorite list
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static List<String> savedFavorites = [];//IDs
  static void saveList() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setStringList("favoriteList", savedFavorites);
  }

  static void loadList() async {
    final SharedPreferences prefs = await _prefs;
    final savedId = (prefs.getStringList("favoriteList") ?? []);
    savedFavorites = savedId;

  }

  static List<String> getList() {
    return savedFavorites;
  }


}
