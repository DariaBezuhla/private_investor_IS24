import 'package:flutter/material.dart';

import 'constant.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    print("switched to" + theme.toString());

    notifyListeners();
  }

  getDisplayTheme(context) {
    return _themeData == dark
        ? CustomStyle.dark(context)
        : CustomStyle.light(context);
  }

  setThemeFromSystem(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;

    setTheme(brightnessValue == Brightness.dark ? dark : light);
  }
}
