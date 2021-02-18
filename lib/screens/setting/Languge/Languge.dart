import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Lang extends StatefulWidget {
  @override
  _Lang createState() => _Lang();
}

class _Lang extends State<Lang> {
  final List<String> nameLang = <String>[
    "Anglais",
    "Français",
    "Espagnol",
    "arabe",
    "chinois",
    "turc",
  ];
  final List<String> flagLang = <String>[
    "🏴󠁧󠁢󠁥󠁮󠁧󠁿",
    "🇫🇷",
    "🇪🇸",
    "🇹🇳",
    "🇨🇳",
    "🇹🇷",
  ];
  final List<String> langugeCode = <String>[
    "en",
    "fr",
    "es",
    "ar",
    "zh",
    "tr",
  ];
  final List<String> capitolCode = <String>[
    "US",
    "FR",
    "ES",
    "TN",
    "CN",
    "TR",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Languages',
        ).tr(),
        centerTitle: true,
        // backgroundColor: Color.fromRGBO(36, 32, 32, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ListView.builder(
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
                      ).tr(),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Text(flagLang[index])),
                  ],
                ),
              ),
              onTap: () {
                this.setState(() {
                  context.locale =
                      Locale(langugeCode[index], capitolCode[index]);
                });
              },
            );
          },
        ),
      ),
    );
  }
}
