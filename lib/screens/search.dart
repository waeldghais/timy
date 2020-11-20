import 'dart:async';
import 'package:TimyTimeMain/models/channelData.dart';
import 'package:TimyTimeMain/models/showsData.dart';
import 'package:TimyTimeMain/screens/detail-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_time_format/date_time_format.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController editingController = TextEditingController();
  List<Shows> duplicateItems = [];
  List<Shows> items = [];
  String firstHalf;
  bool isLoading = true;
  String secondHalf;

  @override
  void initState() {
    //   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    //   var android = AndroidInitializationSettings('ic_launcher');
    //   var iOS = IOSInitializationSettings();
    //   var initSettings = InitializationSettings(android, iOS);
    //   flutterLocalNotificationsPlugin.initialize(initSettings,
    //       onSelectNotification:onSelectNotification );
    Future.delayed(Duration(seconds: 0), () async {
      await Provider.of<ShowsModel>(context, listen: false).getShows();
      await Provider.of<ChannelModel>(context, listen: false).getChannels();
      setState(() {
        isLoading = false;
        duplicateItems = Provider.of<ShowsModel>(context, listen: false).shows;
      });
    });
    super.initState();
  }

  // Future<dynamic> onSelectNotification(String payload){
  //   Timer(Duration(seconds: 2),(){
  //     Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailScreen(payload)));
  //   });
  // }

  void filterSearchResults(String query) async {
    if (query.isNotEmpty) {
      List<Shows> tempList = [];
      duplicateItems.forEach((item) {
        if (item.showTitle.toLowerCase().contains(query.toLowerCase()))
          tempList.add(item);
      });
      setState(() {
        items = [];
        items = tempList;
      });
    } else {
      setState(() {
        items = [];
      });
    }
  }

  bool result = false;

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    return new Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.black),
              child: Column(
                children: <Widget>[
                  _searchBox(),
                  Expanded(
                    child: items.length == 0
                        ? _noResult()
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final shows = Provider.of<ShowsModel>(context)
                                  .findById(items[index].id);
                              final _channel =
                                  Provider.of<ChannelModel>(context)
                                      .findById(shows.channelUid);
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return DetailScreen(items[index].id);
                                    }));
                                  },
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        child: Card(
                                          margin: EdgeInsets.only(
                                              top: devHeight * 0.023,
                                              left: 20,
                                              right: 20,
                                              bottom: devHeight * 0.0337),
                                          elevation: 3,
                                          child: Container(
                                            width: 350,
                                            height: devHeight * 0.202,
                                            color:
                                                Color.fromRGBO(36, 42, 78, 0.9),
                                            child: Row(children: <Widget>[
                                              _showImage(index),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                  child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          SizedBox(height: 3),
                                                          _showTitle(index),
                                                          SizedBox(height: 2),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 17),
                                                            child:
                                                                _mainLanguage(
                                                                    index),
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 17),
                                                            child: _subTitle(
                                                                index),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 18,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10,
                                                                      right: 5),
                                                              child: ClipOval(
                                                                child:
                                                                    _channelLogo(
                                                                        _channel),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Row(
                                                            children: <Widget>[
                                                              Text(
                                                                "Premier",
                                                                style: TextStyle(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              SizedBox(
                                                                width: 7,
                                                              ),
                                                              _premierDateTime(
                                                                  index),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          Row(
                                                            children: <Widget>[
                                                              Text(
                                                                "Replay1",
                                                                style: TextStyle(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              SizedBox(
                                                                width: 7,
                                                              ),
                                                              _replay1DateTime(
                                                                  index),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          Row(
                                                            children: <Widget>[
                                                              Text(
                                                                "Replay2",
                                                                style: TextStyle(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              SizedBox(
                                                                width: 7,
                                                              ),
                                                              _replay2DateTime(
                                                                  index),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )),
                                            ]),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 150,
                                        left: 55,
                                        child: Container(
                                          color: Color.fromRGBO(40, 47, 85, 1),
                                          height: devHeight * 0.0422,
                                          width: 60,
                                          child: Center(
                                            child: _showGenre(index),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ));
                            },
                          ),
                  ),
                ],
              ),
            ),
    );
  }

  _noResult() {
    return Center(
      child: Text(
        result ? "No Result" : " ",
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }

  _searchBox() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.067,
          left: MediaQuery.of(context).size.width * 0.0333,
          right: MediaQuery.of(context).size.width * 0.0333,
          bottom: 3),
      child: TextField(
        onSubmitted: (val) {
          filterSearchResults(val);
        },
        style: TextStyle(color: Colors.white, fontSize: 25),
        onChanged: (value) {
          //     filterSearchResults(value);
        },
        onTap: () {
          result = !result;
        },
        controller: editingController,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(32, 32, 32, 1),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              borderSide: BorderSide(width: 3, color: Colors.grey[500]),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              borderSide: BorderSide(color: Colors.white, width: 3.0),
            ),
            focusColor: Colors.white,
            hintText: "Enter show name",
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      ),
    );
  }

// Search Result Data Elements *********************************************************

  _showImage(int index) {
    return Image.network(
      items[index].showsCoverLink,
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height * 0.202,
      width: 100,
    );
  }

  _showTitle(int index) {
    return Text(
      '${items[index].showTitle}',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  _showGenre(int index) {
    return Text(
      items[index].genre,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  _mainLanguage(int index) {
    return Text(
      'Languahe : ${items[index].mainLanguage}',
      style: TextStyle(color: Colors.white),
    );
  }

  _subTitle(int index) {
    return Text(
      'Sub-Title : ${items[index].subTitle}',
      style: TextStyle(color: Colors.white),
    );
  }

  _channelLogo(Channels _channel) {
    return Image.network(
      _channel.logoLink,
      fit: BoxFit.fill,
      height: MediaQuery.of(context).size.height * 0.0844,
      width: 50,
    );
  }

  _premierDateTime(int index) {
    return Text(
      DateTimeFormat.format(items[index].premier, format: 'D, M j, H:i'),
      style: TextStyle(color: Colors.white),
    );
  }

  _replay1DateTime(int index) {
    return Text(
      DateTimeFormat.format(items[index].replay1, format: 'D, M j, H:i'),
      style: TextStyle(color: Colors.white),
    );
  }

  _replay2DateTime(int index) {
    return Text(
      '${items[index].replay2}',
      style: TextStyle(color: Colors.white),
    );
  }
}
