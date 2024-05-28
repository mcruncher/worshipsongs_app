import '../preference/Preference.dart';

class TitleParser
{
  Preference preference = new Preference();
  bool showSecondLanguage = true;
  bool showFirstLanguage = false;

  String parseTitleByLanguage(String name)
  {
    getDefaultPreferences();
    if (showSecondLanguage) {
      return parseSecondLangugaeTitle(name);
    } else if (showFirstLanguage) {
      return parseFirstLangugaeTitle(name);
    } else {
      return parseSecondLangugaeTitle(name);
    }
  }

  String parseFirstLangugaeTitle(String name)
  {
    if(name.contains("{"))
      {
        return name.split('{')[1].replaceAll('}', '');
      } else {
      return name;
    }
  }

  String parseSecondLangugaeTitle(String name)
  {
    if(name.contains("{")) {
      return name.split('{')[0];
    } else {
      return name;
    }
  }

  getDefaultPreferences() async{
    showFirstLanguage = (await preference.getShowLanguagePreference("showFirstLanguage"))!;
    showSecondLanguage = (await preference.getShowLanguagePreference("showSecondLanguage"))!;
  }
}