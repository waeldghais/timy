import 'package:TimyTimeMain/helper/DBHelper.dart';
import 'package:TimyTimeMain/models/channel.dart';
import 'package:TimyTimeMain/models/shows.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import 'detail-screen.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  CalendarController _calendarController = CalendarController();
  List<ScheduledData> scheduledData = [];
  List<Shows> products = [];
  bool isLoading = true;
  Map<DateTime, List<dynamic>> _events =
      {}; //this is map with key of date and value List<dynamic>
  // just want to add values in this map

  initState() {
    Future.delayed(Duration(seconds: 0), () async {
      await DBHelper.deleteOldData('schedule');
      await getScheduledData(context);
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  onSelectDate(DateTime date, List<dynamic> idk) async {
    List<ScheduledData> tempSchedule = [];
    List<Shows> tempShows = [];
    var d = DateFormat('dd-MM-yyyy').format(date);
    final tempData = await DBHelper.getDataByDate('schedule', d);
    if (tempData.isNotEmpty) {
      tempData.forEach((data) {
        tempSchedule.add(ScheduledData(
            id: data['id'], scheduledDate: DateTime.parse(data['date'])));
      });
      for (int i = 0; i < tempSchedule.length; i++) {
        final product = Provider.of<ShowsModel>(context, listen: false)
            .findById(tempSchedule[i].id);
        tempShows.add(product);
      }
    }
    setState(() {
      scheduledData = tempSchedule;
      products = tempShows;
    });
  }

  getScheduledData(BuildContext context) async {
    List<ScheduledData> tempSchedule = [];
    List<Shows> tempShows = [];
    await Provider.of<ShowsModel>(context, listen: false).getShows();
    await Provider.of<ChannelModel>(context, listen: false).getChannels();
    final tempData = await DBHelper.getData('schedule');
    if (tempData.isNotEmpty) {
      tempData.forEach((data) {
        tempSchedule.add(ScheduledData(
            id: data['id'], scheduledDate: DateTime.parse(data['date'])));
        //I want to add value here in map
        //map name?
        _events.addAll({
          DateTime.parse(data['date']): [Colors.white]
        });
        //i thought add all with replace old values
        //there isnt any other map
      });
      for (int i = 0; i < tempSchedule.length; i++) {
        final product = Provider.of<ShowsModel>(context, listen: false)
            .findById(tempSchedule[i].id);
        tempShows.add(product);
      }
    }
    setState(() {
      scheduledData = tempSchedule;
      products = tempShows;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "TimyTime",
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Color.fromRGBO(32, 32, 32, 1)
      // ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 40.0),
                child: Text(
                  "My Schedule",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TableCalendar(
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  startDay: DateTime.now(),
                  calendarStyle: CalendarStyle(
                      weekdayStyle: const TextStyle(color: Colors.white),
                      todayStyle: const TextStyle(color: Colors.yellowAccent),
                      todayColor: Colors.grey[800],
                      selectedColor: Colors.grey,
                      markersPositionBottom: 5,
                      markersColor: Colors.white),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.yellowAccent),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonTextStyle: TextStyle(
                      color: Colors.yellowAccent,
                    ),
                    formatButtonDecoration: BoxDecoration(
                      border: const Border(
                          top: BorderSide(),
                          bottom: BorderSide(),
                          left: BorderSide(),
                          right: BorderSide()),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(2.0)),
                    ),
                    titleTextStyle: TextStyle(color: Colors.white),
                  ),
                  events: _events,
                  initialCalendarFormat: CalendarFormat.week,
                  onDaySelected: onSelectDate,
                  initialSelectedDay: DateTime.now(),
                  calendarController: _calendarController,
                ),
              ),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : scheduledData.isEmpty
                      ? Container(
                          width: double.infinity,
                          // height: double.infinity,
                          decoration: BoxDecoration(color: Colors.black),
                          child: Center(
                            child: Text(
                              "No Shows to watch :(",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Container(
                            // height:500, //wtf
                            width: MediaQuery.of(context).size.width,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: products.length,
                                itemBuilder: (BuildContext context, int i) {
                                  final productsData = Provider.of<ShowsModel>(
                                      context,
                                      listen: false);
                                  final sh =
                                      productsData.findById(products[i].id);
                                  final _channel = Provider.of<ChannelModel>(
                                          context,
                                          listen: false)
                                      .findById(sh.channelUid);
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailScreen(sh.id)),
                                      ).then((value) {
                                        getScheduledData(context);
                                      });
                                    },
                                    child: Card(
                                      margin: EdgeInsets.only(
                                          top: 14, left: 30, right: 30),
                                      elevation: 0,
                                      child: Container(
                                        width: 340,
                                        height: 150,
                                        color: Color.fromRGBO(32, 32, 32, 0.9),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Image.network(
                                                products[i].showsCoverLink,
                                                fit: BoxFit.fill,
                                                errorBuilder:
                                                    (context, stack, error) =>
                                                        Icon(Icons.error),
                                                //height: double.infinity,//wow
                                                height: double.infinity,
                                                width: 100,
                                              ),

                                              // SizedBox(width: 8,),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 50.0),
                                                      child: Text(
                                                        products[i].showTitle,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 70),
                                                      child: Text(
                                                        products[i].genre,
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10.0),
                                                      child: Text(
                                                        'subtitle: ${products[i].subTitle}',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      'Start in ' +
                                                          DateTimeFormat.format(
                                                              scheduledData[i]
                                                                  .scheduledDate,
                                                              format:
                                                                  'D, M j, H:i'),
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.0,
                                                            vertical: 10.0),
                                                    child: InkWell(
                                                      child: Image.network(
                                                        _channel.logoLink,
                                                        fit: BoxFit.fill,
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                      onTap: () {},
                                                    ),
                                                  ),
                                                  Text(
                                                    DateTimeFormat.format(
                                                        sh.premier,
                                                        format: ' H:i'),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        backgroundColor:
                                                            Colors.grey[600]),
                                                  ),
                                                ],
                                              ),
                                            ]),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduledData {
  final String id;
  final DateTime scheduledDate;

  ScheduledData({this.id, this.scheduledDate});
}
