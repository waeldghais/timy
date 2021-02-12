import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  static bool _isDark = false;
  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  bool switchTheme() {
    if (_isDark)
      _isDark = true;
    else
      _isDark = false;
    notifyListeners();
    return _isDark;
  }
}
