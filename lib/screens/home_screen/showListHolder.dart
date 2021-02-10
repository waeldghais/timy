import 'package:TimyTimeMain/models/channelData.dart';
import 'package:TimyTimeMain/models/showsData.dart';
import 'package:TimyTimeMain/screens/detail-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ListOfShows extends StatelessWidget {
  final String name;
  var product;

  ListOfShows({this.name, this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 218,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            left: 20,
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.length,
                itemBuilder: (context, i) {
                  final shows =
                      Provider.of<ShowsModel>(context).findById(product[i].id);
                  final _channel = Provider.of<ChannelModel>(context)
                      .findById(shows.channelUid);
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return DetailScreen(product[i].id);
                        }));
                      },
                      child: Container(
                        height: 180,
                        width: 110,
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              product[i].showsCoverLink,
                              fit: BoxFit.fill,
                              height: 150,
                              width: 110,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.zero,
                                  width: 110,
                                  height: 35,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[800]),
                                  child: Image.network(_channel.logoLink,
                                      height: 30,
                                      width: 40,
                                      fit: BoxFit.scaleDown),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
