import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class DemoLocalizations {
  final Locale locale;
  DemoLocalizations(this.locale);
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, String> _localizedValues;

  Future load() async {
    String jsonStringValeus =
        await rootBundle.loadString('lib/langjson/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValeus);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTraValues(String key) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<DemoLocalizations> delegate =
      DemoLocalizationsDelegate();
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'fr', 'es', 'ar', 'zh', 'tr'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) async {
    DemoLocalizations localization = new DemoLocalizations(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
