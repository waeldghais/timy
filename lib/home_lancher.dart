import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'package:TimyTimeMain/models/showsData.dart';
import 'package:TimyTimeMain/models/channelData.dart';
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
