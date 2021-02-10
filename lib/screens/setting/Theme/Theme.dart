import 'package:flutter/material.dart';
import 'package:TimyTimeMain/screens/setting/Theme/ThemeN.dart';

class Themechange extends StatefulWidget {
  @override
  _Theme createState() => _Theme();
}

class _Theme extends State<Themechange> {
  MyTheme currentTheme = MyTheme();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Theme",
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(36, 32, 32, 1),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  label: Text("Switch Mode"),
                  onPressed: () {
                    currentTheme.switchTheme();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
