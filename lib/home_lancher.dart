import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'package:TimyTimeMain/models/showsData.dart';
import 'package:TimyTimeMain/models/channelData.dart';
import './screens/notification.dart';
import 'screens/setting/Theme/ThemeProvider.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class TimeLayout extends StatelessWidget {
  const TimeLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return TimeLayouts(
      themeProvider: themeProvider,
    );
  }
}

class TimeLayouts extends StatefulWidget with WidgetsBindingObserver {
  final ThemeProvider themeProvider;
  const TimeLayouts({Key key, @required this.themeProvider}) : super(key: key);
  @override
  TimeLayoutState createState() => TimeLayoutState();
}

class TimeLayoutState extends State<TimeLayouts> {
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
          theme: widget.themeProvider.themeData(),
          title: 'TimyTime',
          home: NotificationScreen()),
    );
  }
}
