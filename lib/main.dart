import 'package:TimyTimeMain/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TimyTimeMain/services/auth_service.dart';

import 'Models/user.dart';



void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Wrapper(),
      //home: TimeLayout(),
      ),
    );
  }
}



