import 'package:bank_app/features/settings/data/models/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageLocalDatasource {
  static const _keyCode = "language_code";
  static const _keyName = "language_name";

  Future<void> saveLanguage(LanguageModel language) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_keyCode, language.code);

    await prefs.setString(_keyName, language.name);
  }

  Future<LanguageModel> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    final code = prefs.getString(_keyCode) ?? "en";

    final name = prefs.getString(_keyName) ?? "English";

    return LanguageModel(code: code, name: name);
  }
}
