import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppThemeService
{
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

  setTheme(MaterialColor purple, Brightness brightnessChoice)
  {
      return ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: purple,
          brightness: brightnessChoice,
        ),
      );
  }
}