import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:TimyTimeMain/screens/auth_screens/login.dart';
import 'package:TimyTimeMain/screens/auth_screens/register.dart';


class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
          builder: (context) => Scaffold(
          body: Stack(
            fit: StackFit.expand,

            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage(
                      'assets/welcomebg.jpg'
                    ),
                    fit: BoxFit.cover
                  )
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(38.0),
                child: Center(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: 400,
                        height: 50.0,
                        child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()
                        )
                        );
                        },
                        child: const Text('Register new account', style: TextStyle(fontSize: 20)),
                        color: Hexcolor('#efba29'),
                        textColor: Colors.black,
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(28.0),
                                side: BorderSide(color: Colors.transparent)
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:38.0,left:38.0,right:38.0,bottom:110.0),
                child: Center(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: 400,
                        height: 50.0,
                        child: FlatButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()
                        )
                        );
                        },
                        child: const Text('Login', style: TextStyle(fontSize: 20)),
                        color: Hexcolor('#efba29'),
                        textColor: Colors.black,
                        // elevation: 7,
                        shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(28.0),
                                side: BorderSide(color: Colors.transparent)
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom:180.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                      'Free for all your professional and personal designs',
                      style: TextStyle(fontSize: 15,color: Colors.grey,),textAlign: TextAlign.center,
                        ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom:220.0),
                child: Center(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                    'Watch Scheduler',
                    style: TextStyle(fontSize: 40,color: Colors.white),
                      ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}