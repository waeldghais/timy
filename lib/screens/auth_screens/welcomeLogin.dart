import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:TimyTimeMain/screens/auth_screens/login.dart';
import 'package:TimyTimeMain/screens/auth_screens/register.dart';
import 'package:TimyTimeMain/services/auth_service.dart';

class WelcomeLogin extends StatefulWidget {
  @override
  _WelcomeLoginState createState() => _WelcomeLoginState();
}

class _WelcomeLoginState extends State<WelcomeLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _bgImage(),
              _introTxt(),
              _signIntxt(),
              Padding(
                padding: EdgeInsets.only(top: 350.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _googleSignInBtn(),
                    _facebookBtn(),
                  ],
                ),
              ),
              _emailScreen(),
            ],
          ),
        ),
      ),
    );
  }

  _bgImage() {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: AssetImage('assets/welcomebg.jpg'), fit: BoxFit.cover),
      ),
    );
  }

  _introTxt() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 520.0),
      child: Center(
        child: SizedBox(
          width: 200,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Search, Schedule and watch form any broadcaster in the world',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  _signIntxt() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 300.0),
      child: Center(
        child: SizedBox(
          width: 200,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Sign in with',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  _googleSignInBtn() {
    return GestureDetector(
      //onTap: login(),
      child: Container(
        height: 70.0,
        width: 70.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/google.jpg',
              ),
            )),
      ),
    );
  }

  _facebookBtn() {
    return GestureDetector(
      onTap: () => print('facbook log'),
      child: Container(
        height: 70.0,
        width: 70.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.yellow[700],
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.scaleDown,
              image: AssetImage('assets/fb_log_btn.jpg'),
            )),
      ),
    );
  }

  _emailScreen() {
    return Padding(
      padding: EdgeInsets.only(top: 500.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/email_logo_btn.png',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
