import 'package:TimyTimeMain/screens/home_screen/playing_next.dart';
import 'package:TimyTimeMain/screens/home_screen/playing_now.dart';
import 'package:flutter/cupertino.dart';


class TodayProgram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 218,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: <Widget>[
        ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 145.0,
              child: PlayingNow(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 145.0,
              child: PlayingNext(),           
            ),
          ],
        ),
      ]),
    );
  }
}
