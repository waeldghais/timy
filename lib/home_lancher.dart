import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'package:TimyTimeMain/models/shows.dart';
import 'package:TimyTimeMain/models/channel.dart';
import './screens/notification.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class TimeLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TimeLayoutState();
  }
}

class TimeLayoutState extends State<TimeLayout> {
  final PageStorageBucket bucket = PageStorageBucket();

  initState() {
    super.initState();
  }

  // int _page=2;
  // final position=[
  //   Home(),
  //   Schedule(),
  //   Search(),
  //   Profile(),
  //   Setting(),
  // ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ShowsModel()),
        ChangeNotifierProvider.value(value: ChannelModel()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TimyTime',
          home: NotificationScreen()),
    );
  }
}
