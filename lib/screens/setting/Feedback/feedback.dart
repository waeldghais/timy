import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Feed extends StatefulWidget {
  @override
  _Feed createState() => _Feed();
}

class _Feed extends State<Feed> {
  TextEditingController _subject = new TextEditingController();
  TextEditingController _msg = new TextEditingController();
  TextEditingController _email = new TextEditingController();

  Future<void> sendfeedback(subject, msg, email) async {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);

    if (_subject.text.isNotEmpty &&
        _msg.text.isNotEmpty &&
        _email.text.isNotEmpty) {
      if (!emailValid) {
        Fluttertoast.showToast(
            msg: "Incorrect_Email".tr(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red[300],
            textColor: Colors.black,
            fontSize: 16.0);
        _email.clear();
      } else {
        Firestore.instance
            .collection('feedbacks')
            .add({
              "subject": _subject.text,
              "feedback": _msg.text,
              "from": _email.text
            })
            .then((result) => {
                  Fluttertoast.showToast(
                      msg: "Feedback_sent".tr(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.greenAccent[400],
                      textColor: Colors.black,
                      fontSize: 16.0),
                  _email.clear(),
                  _subject.clear(),
                  _msg.clear(),
                })
            .catchError((err) => print(err));
      }
    } else {
      Fluttertoast.showToast(
          msg: "required_fields".tr(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[300],
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Feedback",
          ).tr(),
          centerTitle: true,
          //backgroundColor: Color.fromRGBO(36, 32, 32, 1),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 40,
              bottom: 40,
              left: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.1,
              top: size.height * 0.1,
              left: 20,
              right: 20,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.04,
                          left: size.height * 0.01,
                          right: size.height * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            cursorColor: Colors.black,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.subject),
                              labelText: "Email".tr(),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            controller: _email,
                          ),
                          const SizedBox(height: 35),
                          TextField(
                            cursorColor: Colors.black,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.subject),
                              labelText: "Subjects".tr(),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            controller: _subject,
                          ),
                          const SizedBox(height: 35),
                          TextField(
                            cursorColor: Colors.black,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.message),
                              labelText: "Your_feedback".tr(),

                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                            controller: _msg,
                            minLines:
                                8, // any number you need (It works as the rows for the textarea)
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                          const SizedBox(height: 25),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.grey[600])),
                            onPressed: () {
                              sendfeedback(
                                  _subject.text, _msg.text, _email.text);
                            },
                            color: Colors.black87,
                            textColor: Colors.white,
                            child: Text("send", style: TextStyle(fontSize: 14))
                                .tr(),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }
}

Future<void> _sendMail(String subject, String msg) async {
  String username = 'clvtuniss@gmail.com';
  String password = '20152636Witbs';

  // ignore: deprecated_member_use
  final smtpServer = gmail(username, password);
  // Use the SmtpServer class to configure an SMTP server:
  // final smtpServer = SmtpServer('smtp.domain.com');
  // See the named arguments of SmtpServer for further configuration
  // options.

  // Create our message.
  final message = Message()
    ..from = Address(username)
    ..recipients.add('waeldghaisdg@gmail.com')
    ..subject = subject
    ..html = "<h4>" + msg + "</h4>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    print(e.message);
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}
