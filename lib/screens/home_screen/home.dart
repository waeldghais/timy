//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:TimyTimeMain/helper/DBHelper.dart';
import 'package:TimyTimeMain/models/channel.dart';
import 'package:TimyTimeMain/models/shows.dart';
import 'package:TimyTimeMain/screens/home_screen/announcement.dart';
import 'package:TimyTimeMain/screens/home_screen/list.dart';
import 'package:TimyTimeMain/screens/home_screen/today_program.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  var product1,
      product2,
      product3,
      product4,
      product5,
      product6,
      product7,
      product8;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () async {
      await DBHelper.deleteOldData('schedule');
      await Provider.of<ShowsModel>(context, listen: false).getShows();
      await Provider.of<ChannelModel>(context, listen: false).getChannels();
      await Provider.of<ShowsModel>(context, listen: false)
          .getCurrentAndNextPlayingShows();
      final List<Shows> _movies = ShowsModel().getGenre("movie");
      final List<Shows> _series = ShowsModel().getGenre("series");
      final List<Shows> _docs = ShowsModel().getGenre("documentary");
      final List<Shows> _sports = ShowsModel().getGenre("sport");
      final List<Shows> _politics = ShowsModel().getGenre("talkShow");
      final List<Shows> _news = ShowsModel().getGenre("news");
      final List<Shows> _reality = ShowsModel().getGenre("Reality");
      currentPage1 = ShowsModel().shows.length - 1.0;
      currentPage2 = _movies.length - 1.0;
      currentPage3 = _series.length - 1.0;
      currentPage4 = _docs.length - 1.0;
      currentPage5 = _sports.length - 1.0;
      currentPage6 = _politics.length - 1.0;
      currentPage7 = _news.length - 1.0;
      currentPage8 = _reality.length - 1.0;

      final productData = Provider.of<ShowsModel>(context, listen: false);
      product1 = productData.shows;
      product2 = productData.getGenre("movie");
      product3 = productData.getGenre("series");
      product4 = productData.getGenre("documentary");
      product5 = productData.getGenre("sport");
      product6 = productData.getGenre("talkShow");
      product7 = productData.getGenre("news");
      product8 = productData.getGenre("Reality");

      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  var currentPage1,
      currentPage2,
      currentPage3,
      currentPage4,
      currentPage5,
      currentPage6,
      currentPage7,
      currentPage8;
  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      PageController controller1 =
          PageController(initialPage: product1.length - 1);
      controller1.addListener(() {
        setState(() {
          currentPage1 = controller1.page;
        });
      });
      PageController controller2 =
          PageController(initialPage: product2.length - 1);
      controller2.addListener(() {
        setState(() {
          currentPage2 = controller2.page;
        });
      });
      PageController controller3 =
          PageController(initialPage: product3.length - 1);
      controller3.addListener(() {
        setState(() {
          currentPage3 = controller3.page;
        });
      });
      PageController controller4 =
          PageController(initialPage: product4.length - 1);
      controller4.addListener(() {
        setState(() {
          currentPage4 = controller4.page;
        });
      });
      PageController controller5 =
          PageController(initialPage: product5.length - 1);
      controller5.addListener(() {
        setState(() {
          currentPage5 = controller5.page;
        });
      });
      PageController controller6 =
          PageController(initialPage: product6.length - 1);
      controller6.addListener(() {
        setState(() {
          currentPage6 = controller6.page;
        });
      });
      PageController controller7 =
          PageController(initialPage: product7.length - 1);
      controller7.addListener(() {
        setState(() {
          currentPage7 = controller7.page;
        });
      });
      PageController controller8 =
          PageController(initialPage: product8.length - 1);
      controller8.addListener(() {
        setState(() {
          currentPage8 = controller8.page;
        });
      });
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "TimyTime",
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(36, 32, 32, 1),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.black),
              //decoration: bgColor,

              child: Container(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: TodayProgram(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 123,
                      ),
                      child: Container(
                        height: 25,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            "Discover Content",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 155, right: 0, left: 0, bottom: 0),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: ListView(
                          children: <Widget>[
                            Announcement("Anouncement"),
                            ListOfShows(
                              name: "Popular in my area",
                              product: product1,
                            ),
                            ListOfShows(
                              name: "movie",
                              product: product2,
                            ),
                            ListOfShows(
                              name: "series",
                              product: product3,
                            ),
                            ListOfShows(
                              name: "documentary",
                              product: product4,
                            ),
                            ListOfShows(
                              name: "sport",
                              product: product5,
                            ),
                            ListOfShows(
                              name: "talkShow",
                              product: product6,
                            ),
                            ListOfShows(
                              name: "news",
                              product: product7,
                            ),
                            ListOfShows(
                              name: "Reality Shows",
                              product: product8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: (){
      //   Firestore.instance.collection('shows')
      //   .snapshots()
      //   .listen((data) {
      //     print(data.documents[1]['category']);
      //   });
      // }),
    );
  }
}
