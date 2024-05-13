import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppThemeService
{
  // Get the color and brightness from SharedPreference when we introduce it.
  MaterialColor appMaterialColor = Colors.purple;
  Brightness appBrightness = Brightness.light;

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

  setTheme()
  {
      return ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: appMaterialColor,
          brightness: appBrightness,
        ),
      );
  }

  MaterialColor getAppMaterialColor()
  {
    return appMaterialColor;
  }
}