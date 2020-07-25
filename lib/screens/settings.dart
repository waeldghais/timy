import 'package:flutter/material.dart';


class Setting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.black),
          child:  Center(child: Text("Settings",
          style: TextStyle(color: Colors.white,fontSize: 30),),)

      ),
    );
  }
}