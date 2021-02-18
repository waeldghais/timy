import 'package:TimyTimeMain/screens/auth_screens/welcomeLogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Models/user.dart';
import 'home_lancher.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either Home or Authenticate widget
    if (user == null) {
      //return Welcome();
      return WelcomeLogin();
    } else {
      return TimeLayout();
    }
  }
}
