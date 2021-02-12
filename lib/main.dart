import 'package:TimyTimeMain/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TimyTimeMain/services/auth_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'Models/user.dart';
import 'package:TimyTimeMain/screens/setting/Theme/configTheme.dart';

void main() {
  runApp(EasyLocalization(
    child: MyProvider(),
    supportedLocales: [
      Locale('en', 'US'),
      Locale('fr', 'FR'),
      Locale('es', 'ES'),
      Locale('ar', 'TN'),
      Locale('zh', 'CN'),
      Locale('tr', 'TR')
    ],
    fallbackLocale: Locale('en', 'US'),
    path: 'assets/lang',
  ));
}

class MyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentTheme.addListener(() {
      print('change');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    this.setState(() {
      context.locale;
    });

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: currentTheme.currentTheme(),
        home: Wrapper(),
        //home: TimeLayout(),
      ),
    );
  }
}
