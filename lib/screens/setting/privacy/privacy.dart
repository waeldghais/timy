import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PrivacyPage extends StatefulWidget {
  @override
  _PrivacyPage createState() => _PrivacyPage();
}

class _PrivacyPage extends State<PrivacyPage> {
  bool selecteddef = false;
  bool selectedPersonalData = false;
  bool selectedcollectData = false;
  bool selectedtransferData = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "privacy",
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
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.04,
                          left: size.height * 0.01,
                          right: size.height * 0.01),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _defPrivacy(size),
                            SizedBox(height: size.height * 0.04),
                            _personelData(size),
                            SizedBox(height: size.height * 0.04),
                            _collectData(size),
                            SizedBox(height: size.height * 0.04),
                            _transferData(size)
                          ],
                        ),
                      )),
                )),
          ],
        ));
  }

  _defPrivacy(size) {
    return GestureDetector(
      child: AnimatedContainer(
          width: size.width,
          height: selecteddef ? size.height * 0.5 : size.height * 0.11,
          color: selecteddef ? Colors.black45 : Colors.white54,
          alignment:
              selecteddef ? Alignment.center : AlignmentDirectional.topCenter,
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.width * 0.07),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_right_rounded),
                      Expanded(
                        child: Text(
                          'Global_deffintion',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ).tr(),
                      ),
                    ],
                  ),
                ),
                selecteddef
                    ? Column(
                        children: [
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(19.0),
                            child: Text(
                              'deffintion_P',
                              style: TextStyle(
                                  fontSize: 20.0, fontStyle: FontStyle.italic),
                            ).tr(),
                          )
                        ],
                      )
                    : Container()
              ],
            ),
          )),
      onTap: () {
        setState(() {
          selecteddef = !selecteddef;
        });
      },
    );
  }

  _personelData(size) {
    return GestureDetector(
      child: AnimatedContainer(
          width: size.width,
          height: selectedPersonalData ? size.height * 0.5 : size.height * 0.11,
          color: selectedPersonalData ? Colors.black45 : Colors.white54,
          alignment: selectedPersonalData
              ? Alignment.center
              : AlignmentDirectional.topCenter,
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.width * 0.07),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_right_rounded),
                      Expanded(
                        child: Text(
                          'PersoneData',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ).tr(),
                      ),
                    ],
                  ),
                ),
                selectedPersonalData
                    ? Column(
                        children: [
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(19.0),
                            child: Text(
                              'personelDataText',
                              style: TextStyle(
                                  fontSize: 20.0, fontStyle: FontStyle.italic),
                            ).tr(),
                          )
                        ],
                      )
                    : Container()
              ],
            ),
          )),
      onTap: () {
        setState(() {
          selectedPersonalData = !selectedPersonalData;
        });
      },
    );
  }

  _collectData(size) {
    return GestureDetector(
      child: AnimatedContainer(
          width: size.width,
          height: selectedcollectData ? size.height * 0.5 : size.height * 0.11,
          color: selectedcollectData ? Colors.black45 : Colors.white54,
          alignment: selectedcollectData
              ? Alignment.center
              : AlignmentDirectional.topCenter,
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.width * 0.07),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_right_rounded),
                      Expanded(
                        child: Text(
                          'collectData',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ).tr(),
                      ),
                    ],
                  ),
                ),
                selectedcollectData
                    ? Column(
                        children: [
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(19.0),
                            child: Text(
                              'CollectText',
                              style: TextStyle(
                                  fontSize: 20.0, fontStyle: FontStyle.italic),
                            ).tr(),
                          )
                        ],
                      )
                    : Container()
              ],
            ),
          )),
      onTap: () {
        setState(() {
          selectedcollectData = !selectedcollectData;
        });
      },
    );
  }

  _transferData(size) {
    return GestureDetector(
      child: AnimatedContainer(
          width: size.width,
          height: selectedtransferData ? size.height * 0.5 : size.height * 0.11,
          color: selectedtransferData ? Colors.black45 : Colors.white54,
          alignment: selectedtransferData
              ? Alignment.center
              : AlignmentDirectional.topCenter,
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.width * 0.07),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_right_rounded),
                      Expanded(
                        child: Text(
                          'transferData',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ).tr(),
                      ),
                    ],
                  ),
                ),
                selectedtransferData
                    ? Column(
                        children: [
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(19.0),
                            child: Text(
                              'transferDataText',
                              style: TextStyle(
                                  fontSize: 20.0, fontStyle: FontStyle.italic),
                            ).tr(),
                          )
                        ],
                      )
                    : Container()
              ],
            ),
          )),
      onTap: () {
        setState(() {
          selectedtransferData = !selectedtransferData;
        });
      },
    );
  }
}
