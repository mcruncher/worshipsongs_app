import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:worshipsongs_app/preference/Preference.dart';
import 'package:worshipsongs_app/service/AppThemeService.dart';

class SettingWidget extends StatefulWidget
{

  SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  Preference preference = new Preference();
  AppThemeService appThemeService = AppThemeService();
  String? selectedLanguage;
  bool lightTheme = true;
  bool showSecondLanguage = true;
  bool showFirstLanguage = false;

  @override
  Widget build(BuildContext context) {
    getDefaultPreferences();
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: SettingsList(
        sections: [SettingsSection(
          title: Text('Lyrics preference'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.title),
              title: Text('English'),
              trailing: Switch(
                value: showFirstLanguage,
                activeColor: appThemeService.appMaterialColor,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    showFirstLanguage = value;
                    preference.setShowLanguagePreference("showFirstLanguage", showFirstLanguage);
                    print('First lang - $showFirstLanguage');
                  });
                },
              ),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.title),
              title: Text('தமிழ்'),
              trailing: Switch(
                value: showSecondLanguage,
                activeColor: appThemeService.appMaterialColor,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    showSecondLanguage = value;
                    preference.setShowLanguagePreference("showSecondLanguage", showSecondLanguage);
                    print('Second lang - $showSecondLanguage');
                  });
                },
              ),
            ),
          ],
        ),
          SettingsSection(
            title: Text('Light theme selection'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.color_lens),
                title: Text('Light theme'),
                trailing: Switch(
                  value: lightTheme,
                  activeColor: appThemeService.appMaterialColor,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      lightTheme = value;
                      preference.setLightThemeSelection(lightTheme);
                      appThemeService.setLightThemeSelection(lightTheme);
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getDefaultPreferences() async{
      selectedLanguage = preference.getLanguage().toString();
      lightTheme = (await preference.getLightThemeSelection())!;
      showFirstLanguage = (await preference.getShowLanguagePreference("showFirstLanguage"))!;
      showSecondLanguage = (await preference.getShowLanguagePreference("showSecondLanguage"))!;
    // This is where you save the data and then when the user second time opens  he will get the stoared data
    setState(() {});
  }
}