import 'package:TimyTimeMain/helper/DBHelper.dart';

import 'package:TimyTimeMain/models/channel.dart';
import 'package:TimyTimeMain/models/shows.dart';
import 'package:TimyTimeMain/screens/channel-screen.dart';

import 'package:TimyTimeMain/screens/schedule.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../home_lancher.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  DetailScreen(this.id);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String firstHalf;

  String secondHalf;

  bool flag = true;

  int selectedValue;

  bool isScheduled = false;

  bool isLoading = true;

  initState() {
    selectedValue = 0;
    Future.delayed(Duration(seconds: 0), () async {
      await getStatus();
      final response = await flutterLocalNotificationsPlugin
          .getNotificationAppLaunchDetails();
      if (response.didNotificationLaunchApp) {
        await Provider.of<ShowsModel>(context, listen: false).getShows();
        await Provider.of<ChannelModel>(context, listen: false).getChannels();
      }
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  showNotification(String title, DateTime showTime) async {
    var android = AndroidNotificationDetails(
        'channel id', 'channel name', 'channel description',
        enableVibration: true,
        playSound: true,
        importance: Importance.High,
        priority: Priority.High);
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android, iOS);
    new DateTime.now().add(Duration(seconds: 10));
    await flutterLocalNotificationsPlugin.schedule(
        int.parse(widget.id),
        title,
        'The show is about to start in 15 minutes',
        showTime.subtract(Duration(minutes: 15)),
        platform,
        payload: widget.id);
  }

  Future<void> getStatus() async {
    final data = await DBHelper.getDataByID('schedule', widget.id);
    if (data.isEmpty) return;
    isScheduled = true;
  }

  createAlertDialoge(
      BuildContext context, DateTime premier, DateTime replay, String title) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            title: Text('Choose time'),
            titleTextStyle: TextStyle(color: Colors.white),
            content: StatefulBuilder(
              builder: (context, setState) => Container(
                height: 120,
                child: Column(
                  children: [
                    RadioListTile(
                      value: 1,
                      groupValue: selectedValue,
                      onChanged: (val) {
                        print(val.toString());
                        setState(() {
                          selectedValue = val;
                        });
                      },
                      title: Text(
                        'Premier Show',
                        style: TextStyle(color: Colors.white),
                      ),
                      //subtitle: Here Must show the PREMIER Time of the show
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: selectedValue,
                      onChanged: (val) {
                        print(val.toString());
                        setState(() {
                          selectedValue = val;
                        });
                      },
                      title: Text(
                        'Replay Show',
                        style: TextStyle(color: Colors.white),
                      ),
                      //subtitle: Here Must show the REPLAY Time of the show
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () async {
                  if (selectedValue == 0)
                    return;
                  else if (selectedValue == 1) {
                    var d = DateFormat('dd-MM-yyyy').format(premier);
                    DBHelper.insert('schedule', {
                      'id': widget.id,
                      'date': premier.toIso8601String(),
                      'compare': d
                    });
                    await showNotification(title, premier);
                    Navigator.of(context).pop();
                  } else if (selectedValue == 2) {
                    var d = DateFormat('dd-MM-yyyy').format(replay);
                    DBHelper.insert('schedule', {
                      'id': widget.id,
                      'date': replay.toIso8601String(),
                      'compare': d
                    });
                    await showNotification(title, replay);
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final shows = Provider.of<ShowsModel>(context).findById(widget.id);
    final _channel =
        Provider.of<ChannelModel>(context).findById(shows.channelUid);
    if (shows.description.length > 50) {
      firstHalf = shows.description.substring(0, 50);
      secondHalf = shows.description.substring(50, shows.description.length);
    } else {
      firstHalf = shows.description;
      secondHalf = "";
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image.asset(
              'assets/appbar_logo45.png',
              fit: BoxFit.cover,
              height: 42,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Stack(
                    children: <Widget>[
///////////// this is the cover image properties
                      Container(
                        width: double.infinity,
                        height: 450,
                        child: ShaderMask(
                          shaderCallback: (rectangle) {
                            return LinearGradient(
                                    colors: [Colors.black, Colors.transparent],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)
                                .createShader(Rect.fromLTRB(
                                    0, 0, rectangle.width, rectangle.height));
                          },
                          blendMode: BlendMode.dstIn,
                          child: Image.network(
                            shows.showsCoverLink,
                            fit: BoxFit.fill,
                            height: 240,
                            width: double.infinity,
                          ),
                        ),
                      ),

/////////////// Schedule info container  ////////////////////////////////////////////////////
                      Padding(
                        padding: EdgeInsets.only(top: 400.0, bottom: 1),
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 25, left: 30, right: 30),
                              child: Container(
                                height: 95,
                                color: Color.fromRGBO(32, 32, 32, 1),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 30,
                                      width: double.infinity,
                                      color: Color.fromRGBO(64, 64, 64, 0.8),
                                      child: Center(
                                        child: Text(
                                          "Broadcasting time",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Expanded(
                                            child: Row(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  " Premier ",
                                                  style: TextStyle(
                                                      backgroundColor:
                                                          Colors.redAccent,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  DateTimeFormat.format(
                                                      shows.premier,
                                                      format: 'D, M j, H:i'),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  " Replay1 ",
                                                  style: TextStyle(
                                                      backgroundColor:
                                                          Colors.yellow[700],
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Text(
                                                  DateTimeFormat.format(
                                                      shows.replay1,
                                                      format: 'D, M j, H:i'),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),

                                          // Duration bloc
                                          // Expanded(
                                          //   child: Row(
                                          //     children: <Widget>[
                                          //       // Text(
                                          //       //   "Duration",
                                          //       //   style: TextStyle(
                                          //       //       color: Colors.white,
                                          //       //       fontWeight:
                                          //       //           FontWeight.bold),
                                          //       // ),
                                          //       SizedBox(
                                          //         width: 7,
                                          //       ),
                                          //       // Text(
                                          //       //   "2h:30",
                                          //       //   style: TextStyle(
                                          //       //       color: Colors.white),
                                          //       // ),
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

//////////////////// Language info ///////////////////////////////////////////////////////////////
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 15, left: 30, right: 30),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Container(
                                  height: 95,
                                  color: Color.fromRGBO(64, 64, 64, 1),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 30,
                                        width: double.infinity,
                                        color: Color.fromRGBO(32, 32, 32, 1),
                                        child: Center(
                                          child: Text(
                                            "Language",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    "Main voice :",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  Text(
                                                    shows.mainLanguage,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    "Sub-Title :",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  Text(
                                                    shows.subTitle,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

//////////////////// desciption //////////////////////////////////////////////////////////
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: 15.0, top: 25, left: 30, right: 30),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      color: Color.fromRGBO(32, 32, 32, 0.8),
                                      height: 30,
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                          "Description",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 5.0),
                                    color: Color.fromRGBO(64, 64, 64, 1),
                                    child: secondHalf.isEmpty
                                        ? new Text(firstHalf)
                                        : new Column(
                                            children: <Widget>[
                                              new Text(
                                                flag
                                                    ? (firstHalf + "...")
                                                    : (firstHalf + secondHalf),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                              new InkWell(
                                                child: new Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Text(
                                                      flag
                                                          ? "show more"
                                                          : "show less",
                                                      style: new TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    flag = !flag;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

//////////////////////// Channel logo ///////////////////////////////////////////
                      ///
                      Positioned(
                        top: 300,
                        left: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  child: Image.network(
                                    _channel.logoLink,
                                    fit: BoxFit.contain,
                                    height: 60,
                                    width: 60,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChannelScreen(shows.channelUid)),
                                    );
                                  },
                                ),
                                ///////////////// show title  ///////////////////
                                Text(shows.showTitle,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                      ),

/////////////////// Add to my schedul button  //////////////////////////////////////////s
                      Positioned(
                        top: 340,
                        right: 20,
                        child: Container(
                          height: 30,
                          width: 30,
                          color: Color.fromRGBO(64, 64, 64, 1).withOpacity(0.8),
                          child: IconButton(
                            padding: EdgeInsets.symmetric(),
                            icon: Icon(
                              isScheduled ? Icons.remove : Icons.add,
                              size: 30,
                              color: Colors.white,
                            ),
                            onPressed: !isScheduled
                                ? () async {
                                    await createAlertDialoge(
                                        context,
                                        shows.premier,
                                        shows.replay1,
                                        shows.showTitle);
                                    // setState(() {
                                    //   shows.toggleScheduleStatus();
                                    //   // if (shows.isAddToSchedule) {
                                    //   //   Navigator.push(
                                    //   //     context,
                                    //   //     MaterialPageRoute(builder: (context) => Schedule()),
                                    //   //   );
                                    //   // } else {
                                    //   //   Navigator.push(
                                    //   //     context,
                                    //   //     MaterialPageRoute(builder: (context) => Schedule()),
                                    //   //   );
                                    //   // }
                                    // });
                                    if (selectedValue == 0)
                                      Navigator.of(context).pop();
                                    else {
                                      setState(() {
                                        isScheduled = true;
                                      });
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => Schedule()));
                                    }
                                  }
                                : () async {
                                    DBHelper.deleteData('schedule', widget.id);
                                    await flutterLocalNotificationsPlugin
                                        .cancel(int.parse(widget.id));
                                    setState(() {
                                      isScheduled = false;
                                    });
                                  },
                          ),
                        ),
                      ),
//////////////////////////  Genre  ///////////////////////////////////////////////////////
                      Positioned(
                        top: 340,
                        right: 60,
                        child: Container(
                          height: 30,
                          width: 85,
                          color: Color.fromRGBO(64, 64, 64, 1).withOpacity(0.8),
                          child: Center(
                            child: Text(shows.genre,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                          ),
                        ),
                      ),

////////////////////// Scheduled  /////////////////////////////////////////////////:::::
                      Positioned(
                        top: 380,
                        right: 30,
                        child: Text("Scheduled: 7886",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
