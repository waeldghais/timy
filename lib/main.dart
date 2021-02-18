import 'package:TimyTimeMain/screens/setting/Theme/ThemeProvider.dart';
import 'package:TimyTimeMain/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TimyTimeMain/services/auth_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'Models/user.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);

  final settings = await Hive.openBox('settings');
  bool isLightTheme = settings.get('isLightTheme') ?? false;

  print(isLightTheme);

  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(isLightTheme: isLightTheme),
    child: EasyLocalization(
      child: AppStart(),
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
    ),
  ));
}
// to ensure we have the themeProvider before the app starts lets make a few more changes.

class AppStart extends StatelessWidget {
  const AppStart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MyApp(
      themeProvider: themeProvider,
    );
  }
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  final ThemeProvider themeProvider;

  const MyApp({Key key, @required this.themeProvider}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        theme: widget.themeProvider.themeData(),

        home: Wrapper(),
        //home: TimeLayout(),
      ),
    );
  }
}
