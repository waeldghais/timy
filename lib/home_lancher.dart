import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'package:TimyTimeMain/models/shows.dart';
import 'package:TimyTimeMain/models/channel.dart';
import './screens/notification.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class TimeLayout extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TimeLayoutState();
  }
}

class TimeLayoutState extends State<TimeLayout>{
  final PageStorageBucket bucket = PageStorageBucket();

 

  initState(){
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
         home:NotificationScreen() 
         //Scaffold(
        //   body: PageStorage(
        //     bucket: bucket,
        //       child: position[_page]),
        //       bottomNavigationBar: BottomNavigationBar(
        //       currentIndex: _page,
        //       iconSize: 30,
        //       unselectedItemColor: Colors.grey,
        //       selectedItemColor: Colors.white,
        //       showSelectedLabels: false,
        //       showUnselectedLabels: false,
        //       onTap: (index){
        //       setState(() {
        //         _page=index;
        //       });
        //     },
        //     items: [
        //       BottomNavigationBarItem(icon:Icon(Icons.home),title: Text('Home'),backgroundColor: Color.fromRGBO(32, 32, 32, 1),),
        //       BottomNavigationBarItem(icon:Icon(Icons.tv),title: Text('Schedule'),backgroundColor: Color.fromRGBO(32, 32, 32, 1),),
        //       BottomNavigationBarItem(icon:Icon(Icons.search),title: Text('Search'),backgroundColor: Color.fromRGBO(32, 32, 32, 1),),
        //       BottomNavigationBarItem(icon:Icon(Icons.person),title: Text('Profile'),backgroundColor: Color.fromRGBO(32, 32, 32, 1),),
        //       BottomNavigationBarItem(icon:Icon(FontAwesomeIcons.slidersH,),title: Text('Settings'),backgroundColor: Color.fromRGBO(32, 32, 32, 1),)
        //       // BottomNavigationBarItem(icon:Icon(FontAwesomeIcons.slidersH,),title: Text('Settings'),backgroundColor: Color(0xff1B213B),)
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
