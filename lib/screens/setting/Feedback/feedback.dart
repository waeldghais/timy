import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _Feed createState() => _Feed();
}

class _Feed extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Feedback",
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(36, 32, 32, 1),
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 20,
              top: 20,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
