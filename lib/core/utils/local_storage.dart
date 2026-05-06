import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  LocalStorage._internal();

  factory LocalStorage() {
    return _instance;
  }
  late final SharedPreferences prefs;
  static final LocalStorage _instance = LocalStorage._internal();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
