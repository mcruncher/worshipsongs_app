import 'package:shared_preferences/shared_preferences.dart';

class Preference
{
  getPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  setDefaultPreferences()
  async {
    SharedPreferences sharedPreferences = await getPreferences();
    sharedPreferences.setString("firstLanguage", "English");
    sharedPreferences.setBool("lightTheme", true);
    sharedPreferences.setBool("lightThemeSelection", true);
    sharedPreferences.setBool("showFirstLanguage", true);
    sharedPreferences.setBool("showSecondLanguage", true);
  }

  Future<String> getLanguage()
  async {
    SharedPreferences sharedPreferences = await getPreferences();
    return sharedPreferences.getString("firstLanguage").toString();
  }

  setLanguage(String language)
  async {
    SharedPreferences sharedPreferences = await getPreferences();
    sharedPreferences.setString("firstLanguage", language);
  }

  Future<bool?> getLightThemeSelection()
  async {
    SharedPreferences sharedPreferences = await getPreferences();
    return sharedPreferences.getBool("lightThemeSelection");
  }

  setLightThemeSelection(bool value)
  async {
    SharedPreferences sharedPreferences = await getPreferences();
    sharedPreferences.setBool("lightThemeSelection", value);
  }

  Future<bool?> getShowLanguagePreference(String language)
  async {
    SharedPreferences sharedPreferences = await getPreferences();
    return sharedPreferences.getBool(language);
  }

  setShowLanguagePreference(String language, bool value)
  async {
    SharedPreferences sharedPreferences = await getPreferences();
    sharedPreferences.setBool(language, value);
  }
}