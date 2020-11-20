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
        onSelectNotification: onSelectNotification);
    super.initState();
  }

  Future<dynamic> onSelectNotification(String payload) async {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => DetailScreen(payload)));
    });
  }

  int _page = 2;

  final position = [
    Home(),
    Schedule(),
    Search(),
    Profile(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: position[_page]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        iconSize: 30,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: [
          _homeNavIcon(),
          _scheduleNavIcon(),
          _searchNavIcon(),
          _profileNavIcon(),
          _settingsNavIcon(),
        ],
      ),
    );
  }

  _homeNavIcon() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: ('Home'),
      backgroundColor: Color.fromRGBO(32, 32, 32, 1),
    );
  }

  _scheduleNavIcon() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.tv),
      label: ('Schedule'),
      backgroundColor: Color.fromRGBO(32, 32, 32, 1),
    );
  }

  _searchNavIcon() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: ('Search'),
      backgroundColor: Color.fromRGBO(32, 32, 32, 1),
    );
  }

  _profileNavIcon() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: ('Profile'),
      backgroundColor: Color.fromRGBO(32, 32, 32, 1),
    );
  }

  _settingsNavIcon() {
    return BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.slidersH,
      ),
      label: ('Settings'),
      backgroundColor: Color.fromRGBO(32, 32, 32, 1),
    );
  }
}
