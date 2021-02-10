import 'package:TimyTimeMain/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TimyTimeMain/services/auth_service.dart';
import 'package:TimyTimeMain/screens/setting/Theme/ThemeN.dart';
import 'Models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyTheme currentTheme = MyTheme();
  @override
  void initState() {
    currentTheme.addListener(() {
      print("change");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: currentTheme.currentTheme(),
        home: Wrapper(),
        //home: TimeLayout(),
      ),
    );
  }
}
