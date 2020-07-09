// This widget will be in Home Screen to show the user the NEXT playing program
// it contain the name of programm/countdown timer/cover img/channel logo
import 'package:TimyTimeMain/models/channel.dart';
import 'package:TimyTimeMain/screens/detail-screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../models/shows.dart';

class PlayingNext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Channels playingNextChannel;
   final playingNext= Provider.of<ShowsModel>(context,listen: false).nextPlaying;
   if(playingNext.isNotEmpty){
     playingNextChannel=Provider.of<ChannelModel>(context,listen: false).findByChannelId(playingNext[0].channelUid);
   }
    return Container(
      child: Stack(children: <Widget>[
        Container(
          width: double.infinity,
          height: 145.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 90,
                    color: Color.fromRGBO(64, 64, 64, 1),
                    child:playingNext.isEmpty?Center(child:Text('No Show in 24 hours') ): GestureDetector(
                      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailScreen(playingNext[0].id))),
                                          child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 90,
                              width: 70,
                              color: Color.fromRGBO(32, 32, 32, 1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Playing",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                  Text(
                                    "NEXT",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      playingNext[0].showTitle,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                          textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Center(
                                        child: Image.network(
                                  playingNextChannel.logoLink,
                                  height: 70,
                                  width: 90,
                                )))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 0, top: 0, bottom: 0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  playingNext[0].showsCoverLink,
                                  fit: BoxFit.cover,
                                  width: 70,
                                  height: double.infinity,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                left: 40,
                right: 40,
                top: 25,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
