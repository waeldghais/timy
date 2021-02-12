import 'package:flutter/cupertino.dart';

class ThemeNotifie extends ChangeNotifier {
  String _themeName = 'Light';

  get theme => _themeName;

  toggletheme() {
    if (_themeName == 'Light') {
      _themeName = 'dark';
    } else if (_themeName == 'dark') {
      _themeName = 'Light';
    } else {
      _themeName = 'dark';
    }
    notifyListeners();
    return _themeName;
  }
}
