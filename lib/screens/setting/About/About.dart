import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class About extends StatefulWidget {
  @override
  _About createState() => _About();
}

class _About extends State<About> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "About".tr(),
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
                  color: Colors.black45,
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
                          Text('TimyTime',
                              style: TextStyle(
                                  fontSize: 30.0, fontStyle: FontStyle.italic)),
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('About_text',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic))
                                .tr(),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }
}
