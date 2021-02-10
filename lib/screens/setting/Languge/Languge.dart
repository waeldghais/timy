import 'package:flutter/material.dart';

class Lang extends StatefulWidget {
  @override
  _Lang createState() => _Lang();
}

class _Lang extends State<Lang> {
  var nameLang = [
    "Français",
    "English",
    "Espagnol",
    "العربية",
    "Chinese",
    "Turkish",
  ];
  var flagLang = [
    "🇫🇷",
    "🏴󠁧󠁢󠁥󠁮󠁧󠁿",
    "🇪🇸",
    "🇹🇳",
    "🇨🇳",
    "🇹🇷",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Languages",
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(36, 32, 32, 1),
      ),
      body: ListView.builder(
        itemCount: nameLang.length,
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
                      nameLang[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Text(flagLang[index])),
                ],
              ),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
