import 'package:TimyTimeMain/models/channel.dart';
import 'package:TimyTimeMain/models/shows.dart';
import 'package:TimyTimeMain/screens/show.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';

import 'package:url_launcher/url_launcher.dart';


class ChannelScreen extends StatefulWidget{
  final String id;
  ChannelScreen(this.id);
  @override
  _ChannelScreenState createState() => _ChannelScreenState();
}
var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _ChannelScreenState extends State<ChannelScreen>{
  String firstHalf;

  String secondHalf;

  bool flag = true;

  var currentPage1;
  @override
  // ignore: must_call_super
  void didChangeDependencies() {
     final List<Shows> shows=Provider.of<ShowsModel>(context).getChannelShows(widget.id);
     currentPage1 = shows.length-1.0;
  }



  @override
  Widget build(BuildContext context) {
    final _channel=Provider.of<ChannelModel>(context);
    final channel=_channel.findById(widget.id);
    if (channel.description.length > 50) {
      firstHalf = channel.description.substring(0, 100);
      secondHalf = channel.description.substring(50, channel.description.length);
    } else {
      firstHalf = channel.description;
      secondHalf = "";
    }
    final productData = Provider.of<ShowsModel>(context);
    final product1 = productData.getChannelShows(widget.id);
    PageController controller1 = PageController(initialPage: product1.length - 1);
    controller1.addListener(() {
      setState(() {
        currentPage1 = controller1.page;
      });
    });
    return Scaffold(
      backgroundColor:  Color.fromRGBO(36, 42, 78, 1),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Container(
                height: 280,
                width: double.infinity,color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child:  ClipOval(child: Image.network(channel.coverLink,fit:BoxFit.fill,width: 100,
                          height: 100,)),
                      ),
                    SizedBox(height: 20,),
                    Text(channel.channelName,style: TextStyle(
                      color: Colors.white,fontSize: 25,),)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 290),
              child: Container(
                height:20 ,
                width: double.infinity,
                child: SizedBox(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:8,left: 7),
              child: IconButton(icon: Icon(Icons.arrow_back,size: 40,color: Colors.white,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  }
              ),
            ),
            Positioned(
                top: 253,
                left: 30,
                child: Row(
                  children: <Widget>[
                    ClipOval(child: Image.network(channel.logoLink,fit:BoxFit.cover,height: 50,width: 50,)),
                    SizedBox(width: 30,),
                    RatingBar(
                      size: 30,
                      onRatingChanged: null,
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      filledColor: Colors.yellow,
                      emptyColor: Colors.yellow,
                    ),
                    SizedBox(width: 30,),
                     ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          child: Container(
                            height: 30,
                            width: 60,
                            color: Colors.blue,
                            child: Center(
                              child: Text("Follow",style: TextStyle(
                                color: Colors.black,fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                          onTap: (){
                          },
                        ),
                      )
                  ],
                )

            ),
            Positioned(
                top: 300,
                right: 30,
                child: Text("2345",style: TextStyle(
                    color: Colors.white,fontSize: 18,
                    fontWeight: FontWeight.bold,
                ),),),
            Padding(
              padding: EdgeInsets.only(top: 330),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top:25,left: 30,right: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          child: Container(
                              height: 90,
                              color: Color.fromRGBO(55, 70, 105, 1),
                              child:  Row(
                                children: <Widget>[
                                  Container(
                                    height: 90,
                                    width: 75,
                                    color:Color.fromRGBO(95, 115, 150, 1),
                                    child: Icon(Icons.live_tv,color: Colors.white,size: 60,) ,
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(height:20 ,),
                                        Text("Gender : ${channel.genre}",textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:Colors.white,
                                              fontSize: 17
                                          ),),
                                        SizedBox(height:3,),
                                        Text("Language : ${channel.mainLanguage}",textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:Colors.white,
                                              fontSize: 17
                                          ),),
                                        SizedBox(height:3,),
                                        Text("Sub-title : Arabic",textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:Colors.white,
                                              fontSize: 17
                                          ),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:25,left: 30,right: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          child: Container(
                            height: 90,
                            color: Color.fromRGBO(55, 70, 105, 1),
                            child:  Row(
                              children: <Widget>[
                                Container(
                                  height: 90,
                                  width: 75,
                                  color:Color.fromRGBO(95, 115, 150, 1),
                                  child: Icon(Icons.cast,color: Colors.white,size: 60,) ,
                                ),
                                SizedBox(width: 5,),
                                 Expanded(
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                         Text("Region: Middle East & North East",
                                            style: TextStyle(
                                                color:Colors.white,
                                                fontSize: 13
                                            ),),

                                        Text("Satelite: NileSat frq: ${channel.sateliteFrequency}",
                                          style: TextStyle(
                                              color:Colors.white,
                                              fontSize: 13
                                          ),),
                                         Row(
                                           children: <Widget>[
                                             Text("Web Stream: ",
                                                style: TextStyle(
                                                    color:Colors.white,
                                                    fontSize: 13
                                                ),),
                                             GestureDetector(
                                               child: Text("click here",
                                                   style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                                               onTap: (){
                                                 launch('${channel.webStreamLink}');
                                               },
                                             ),
                                           ],
                                         ),

                                      ],
                                    ),
                                 )

                              ],
                            ),

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:25,left: 30,right: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          child: Container(
                            height: 90,
                            color: Color.fromRGBO(55, 70, 105, 1),
                            child:  Row(
                              children: <Widget>[
                                Container(
                                  height: 90,
                                  width: 75,
                                  color:Color.fromRGBO(95, 115, 150, 1),
                                  child: Icon(Icons.language,color: Colors.white,size: 60,) ,
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Image.asset("images/youtube.png",fit: BoxFit.cover,height: 50,width: 50,),
                                      onTap: (){ launch('${channel.youtubeLink}');},),
                                      GestureDetector(
                                          child: Image.asset("images/insta.jfif",fit: BoxFit.fill,height: 35,width: 35,),
                                      onTap: (){  launch('${channel.instaLink}');}
                                      ),
                                      GestureDetector(
                                          child: Image.asset("images/facebook.jpg",fit: BoxFit.cover,height: 35,width: 35,),
                                          onTap: (){  launch('${""}');}
                                      ),

                                    ],
                                  ),
                                ),

                              ],
                            ),

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 25,left: 30,right: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          color: Color.fromRGBO(55, 70, 105, 1),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  color:Color.fromRGBO(95, 115, 150, 1),
                                  height: 30,width: double.infinity,
                                  child: Center(
                                    child: Text("Description",style: TextStyle(
                                        fontSize: 20,fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                  )
                              ),
                              SizedBox(height: 1,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                color: Color.fromRGBO(55, 70, 105, 1),
                                child: secondHalf.isEmpty
                                    ? new Text(firstHalf)
                                    : new Column(
                                  children: <Widget>[
                                    new Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                                      style: TextStyle(color: Colors.white,fontSize: 15),),
                                    new InkWell(
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Text(
                                            flag ? "show more" : "show less",
                                            style: new TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: ShowsList(name: "Shows",product: product1,)),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}