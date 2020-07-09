import 'package:TimyTimeMain/services/auth_service.dart';
import 'package:TimyTimeMain/styling/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Profile extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff09031D),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff09031D),
        title: Text(
          "Profil",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              color: Colors.white,
              label: Text('Logout'),
              
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Profile info
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 28.0, top: 7.0),
                child: CircleAvatar(
                    radius: 44,
                    backgroundImage: NetworkImage(
                        'https://scontent.ftun9-1.fna.fbcdn.net/v/t1.0-1/p160x160/17201138_10155836614569325_3797872957528948739_n.jpg?_nc_cat=111&_nc_sid=dbb9e7&_nc_eui2=AeEQ__8Csx1gdYVSPoNtY0cd2s_RdqRbbkbaz9F2pFtuRtpHUeszIAC6z-Jsn9-rH4A&_nc_ohc=u9tM3WTHCnkAX-MTuHg&_nc_ht=scontent.ftun9-1.fna&_nc_tp=6&oh=c0fcc509010132868706239e033744a9&oe=5EE81BE8')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Karim Lazaar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.location_on,
                              color: Colors.white, size: 17),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "London, UK",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 3,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

          SizedBox(height: 8.0),

          // Follow..
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "12",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0),
                    ),
                    Text(
                      "serie",
                      style: TextStyle(color: Colors.white70, fontSize: 12.0),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "45",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0),
                    ),
                    Text(
                      "sports",
                      style: TextStyle(color: Colors.white70, fontSize: 12.0),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "87",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0),
                    ),
                    Text(
                      "movie",
                      style: TextStyle(color: Colors.white70, fontSize: 12.0),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "42",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0),
                    ),
                    Text(
                      "Doc",
                      style: TextStyle(color: Colors.white70, fontSize: 12.0),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "07",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0),
                    ),
                    Text(
                      "News",
                      style: TextStyle(color: Colors.white70, fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 8.0),

          // Gallery
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15.0),
              decoration: bgColor,
            ),
          ),
        ],
      ),
    );
  }
}
