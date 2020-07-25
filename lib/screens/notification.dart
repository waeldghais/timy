import 'dart:async';

import 'package:TimyTimeMain/screens/detail-screen.dart';
import 'package:TimyTimeMain/screens/home_screen/home.dart';
import 'package:TimyTimeMain/screens/profile.dart';
import 'package:TimyTimeMain/screens/schedule.dart';
import 'package:TimyTimeMain/screens/search.dart';
import 'package:TimyTimeMain/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_lancher.dart';


class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
      var android = AndroidInitializationSettings('ic_launcher');
      var iOS = IOSInitializationSettings();
      var initSettings = InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification:onSelectNotification );
    super.initState();
  }

  Future<dynamic> onSelectNotification(String payload) async{
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailScreen(payload)));
    });
  }

  int _page=2;
  final position=[
    Home(),
    Schedule(),
    Search(),
    Profile(),
    Setting(),
  ];
  @override
  Widget build(BuildContext context) {

        return Scaffold(
          body: PageStorage(
            bucket: bucket,
              child: position[_page]),
              bottomNavigationBar: BottomNavigationBar(
              currentIndex: _page,
              iconSize: 30,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (index){
              setState(() {
                _page=index;
              });
            },
            items: [
              BottomNavigationBarItem(icon:Icon(Icons.home),title: Text('Home'),backgroundColor: Color.fromRGBO(32, 32, 32, 1),),
              BottomNavigationBarItem(icon:Icon(Icons.tv),title: Text('Schedule'),backgroundColor: Color.fromRGBO(32, 32, 32, 1),),
              BottomNavigationBarItem(icon:Icon(Icons.search),title: Text('Search'),backgroundColor: Color.fromRGBO(32, 32, 32, 1),),
              BottomNavigationBarItem(icon:Icon(Icons.person),title: Text('Profile'),backgroundColor: Color.fromRGBO(32, 32, 32, 1),),
              BottomNavigationBarItem(icon:Icon(FontAwesomeIcons.slidersH,),title: Text('Settings'),backgroundColor: Color.fromRGBO(32, 32, 32, 1),)
              // BottomNavigationBarItem(icon:Icon(FontAwesomeIcons.slidersH,),title: Text('Settings'),backgroundColor: Color(0xff1B213B),)
            ],
          ));}}
      