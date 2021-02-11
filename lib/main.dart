import 'package:TimyTimeMain/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TimyTimeMain/services/auth_service.dart';

import 'Models/user.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:TimyTimeMain/localization/demo_localization.dart';
import 'package:TimyTimeMain/localization/Cost_localization.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          localizationsDelegates: [
            DemoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', 'US'),
            Locale('fr', 'FR'),
            Locale('es', 'ES'),
            Locale('ar', 'TN'),
            Locale('zh', 'CN'),
            Locale('tr', 'TR')
          ],
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            for (var locale in supportedLocales) {
              if (locale.languageCode == deviceLocale.languageCode &&
                  locale.countryCode == deviceLocale.countryCode) {
                return deviceLocale;
              }
            }
            return supportedLocales.first;
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          locale: _locale,
          home: Wrapper(),
          //home: TimeLayout(),
        ),
      );
    }
  }
}
