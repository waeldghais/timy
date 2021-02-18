import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:TimyTimeMain/screens/setting/Theme/Theme.dart';
import 'package:TimyTimeMain/screens/setting/Languge/Languge.dart';
import 'package:TimyTimeMain/screens/setting/Feedback/feedback.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:rating_dialog/rating_dialog.dart';
import 'About/About.dart';
import 'privacy/privacy.dart';

class Setting extends StatefulWidget {
  @override
  _Setting createState() => _Setting();
}

class _Setting extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<ThemeNotifie>(context, listen: false);
    this.setState(() {
      context.locale;
    });

    var str = [
      "Theme",
      "Languages",
      "privacy",
      "About",
      "Notifications",
      "Feedback",
      "Rate",
    ];

    final List<Icon> iconsList = <Icon>[
      Icon(
        Icons.brightness_4,
        size: 24.0,
      ),
      Icon(
        Icons.language,
        size: 24.0,
      ),
      Icon(
        Icons.phonelink_lock,
        size: 24.0,
      ),
      Icon(
        Icons.live_help,
        size: 24.0,
      ),
      Icon(
        Icons.notifications_active,
        size: 24.0,
      ),
      Icon(
        Icons.feedback,
        size: 24.0,
      ),
      Icon(
        Icons.star,
        size: 24.0,
      ),
      Icon(
        Icons.star,
        size: 24.0,
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Setting',
          ).tr(),
          centerTitle: true,
          //backgroundColor: Color.fromRGBO(36, 32, 32, 1),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView.builder(
            itemCount: str.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  decoration: new BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.white12, Colors.white70],
                      ),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8.0,
                        ),
                      ]),
                  margin: EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          str[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ).tr(),
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: iconsList[index]),
                    ],
                  ),
                ),
                onTap: () {
                  gettap(str[index], context);
                },
              );
            },
          ),
        ));
  }
}

String gettap(String value, context) {
  switch (value) {
    case "Theme":
      {
        Navigator.of(context).push(_createRoute(ThemePage()));
      }
      break;
    case "Languages":
      {
        Navigator.of(context).push(_createRoute(Lang()));
      }
      break;
    case "privacy":
      {
        Navigator.of(context).push(_createRoute(PrivacyPage()));
      }
      break;
    case "About":
      {
        Navigator.of(context).push(_createRoute(About()));
      }
      break;
    case "Notifications":
      {
        return (value);
      }
      break;
    case "Feedback":
      {
        Navigator.of(context).push(_createRoute(Feed()));
      }
      break;
    case "Rate":
      {
        _showrate(context);
      }
      break;
  }
  return (value);
}

// ignore: missing_return
Void _showrate(context) {
  showDialog(
      context: context,
      builder: (context) {
        return RatingDialog(
          icon: FlutterLogo(
            size: 100,
          ),
          title: "Rating_Dialog".tr(),
          description: "Tap_rating".tr(),
          onSubmitPressed: (int rating) {
            if (rating <= 3) {
              Fluttertoast.showToast(
                  msg: "Ohh_No".tr(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red[300],
                  textColor: Colors.black,
                  fontSize: 16.0);
              Navigator.of(context).push(_createRoute(Feed()));
            } else {
              Fluttertoast.showToast(
                  msg: "Yess!".tr(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green[300],
                  textColor: Colors.black,
                  fontSize: 16.0);
            }
          },
          submitButton: "submit".tr(),
          positiveComment: "positiveComment".tr(),
          negativeComment: "negativeComment".tr(),
          alternativeButton: "Contact_Us".tr(),
          onAlternativePressed: () {
            Navigator.of(context).push(_createRoute(Feed()));
          },
        );
      });
}

Route _createRoute(dynamic page) {
  return PageRouteBuilder(
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) =>
        page,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) =>
        ScaleTransition(
      scale: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.linearToEaseOut,
        ),
      ),
      child: child,
    ),
  );
}
