// This widget will be in Home Screen to show the user the current playing program
// it contain the name of programm/current time counter/coverimg/channel logo
import 'package:TimyTimeMain/models/channel.dart';
import 'package:TimyTimeMain/screens/detail-screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../models/shows.dart';

class PlayingNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Channels playingNowChannel;
    final playingNow=Provider.of<ShowsModel>(context,listen: false).currentlyPlaying;
    if(playingNow.isNotEmpty){
     playingNowChannel=Provider.of<ChannelModel>(context,listen: false).findByChannelId(playingNow[0].channelUid);
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
                    child:playingNow.isEmpty?Center(child: Text('No Show Playing Now'),): GestureDetector(
                      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailScreen(playingNow[0].id))),
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
                                    "Now",
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
                                      playingNow[0].showTitle,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                          textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Center(
                                        child: Image.network(
                                  playingNowChannel.logoLink,
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
                                  playingNow[0].showsCoverLink,
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
