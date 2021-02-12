import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:easy_localization/easy_localization.dart';

class Feed extends StatefulWidget {
  @override
  _Feed createState() => _Feed();
}

class _Feed extends State<Feed> {
  TextEditingController _subject = new TextEditingController();
  TextEditingController _msg = new TextEditingController();
  TextEditingController _email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Feedback",
          ).tr(),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(36, 32, 32, 1),
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: size.height * 0.1,
              top: size.height * 0.1,
              left: 20,
              right: 20,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * 0.04),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            cursorColor: Colors.black,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.subject),
                              labelText: "Email",
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
                              labelText: "Subject",
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
                          const SizedBox(height: 35),
                          RaisedButton(
                              onPressed: () {
                                _sendMail(_subject.text, _msg.text);
                              },
                              textColor: Colors.white,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(22),
                                      bottomLeft: Radius.circular(22),
                                      bottomRight: Radius.circular(10)),
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color(0xFFBDBDBD),
                                      Color(0xFF787878),
                                      Color(0xFF424242),
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                child: const Text('send',
                                        style: TextStyle(fontSize: 20))
                                    .tr(),
                              )),
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
