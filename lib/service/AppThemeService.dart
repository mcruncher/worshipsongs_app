import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worshipsongs_app/preference/Preference.dart';

class AppThemeService
{
  Preference preference = Preference();
  // Get the color and brightness from SharedPreference when we introduce it.
  MaterialColor appMaterialColor = Colors.purple;
  Brightness appBrightness = Brightness.light;

  Brightness setLightThemeSelection(bool value)
  {
    if(value == true)
      {
        appBrightness = Brightness.light;
      } else if(value == false)
      {
      appBrightness = Brightness.dark;
    } else
    {
      return Brightness.light;
    }
    return appBrightness;
  }

  ColorScheme getColorScheme(BuildContext context)
  {
    return Theme.of(context).colorScheme;
  }

  Color getOddItemColor(BuildContext context)
  {
    ColorScheme colorScheme = getColorScheme(context);
    return colorScheme.primary.withOpacity(0.05);
  }

  Color getEvenItemColor(BuildContext context)
  {
    ColorScheme colorScheme = getColorScheme(context);
    return colorScheme.primary.withOpacity(0.15);
  }

  setTheme(MaterialColor appMaterialColor, Brightness brightness)
  {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: appMaterialColor,
        brightness: brightness,
      ),
    );
  }

  MaterialColor getAppMaterialColor()
  {
    return appMaterialColor;
  }
}