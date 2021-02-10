import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Announcement extends StatelessWidget {
  final String name;
  Announcement(this.name);
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
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, i) => Padding(
                padding: EdgeInsets.only(right: 40),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRcqV9MaZM-SRfpKPF3uZwl1HYecrixpAs_QetF9xFH5N5yjbO5&usqp=CAU'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
