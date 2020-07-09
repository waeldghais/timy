import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// This is the AppBar
final appBarStyle = AppBar(
  title: Text(
    "TimyTime",
  ),
  centerTitle: true,
  backgroundColor: Color.fromRGBO(36, 42, 78, 1),
);

// This is the main Backgrounds for the entire app.

// LinearGradien Background
const bgColor = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
      Color.fromRGBO(21, 23, 37, 1),
      Color.fromRGBO(35, 42, 78, 1),
      Color.fromRGBO(21, 23, 37, 1)
    ]));

// RadialGradien Background.
const bgColorRadial = BoxDecoration(
  gradient: RadialGradient(
    center: const Alignment(0.5, 0.5), // near the top right
    radius: 1.5,
    colors: [
      const Color(0xFF0099FF), // yellow sun
      const Color(0x151624), // blue sky
    ],
    stops: [
      0.7,
      1.0,
    ],
  ),
);

// form decoration
const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink, width: 2.0)),
);

// TextFormField styling

// const txtformStyling = InputDecoration(
//   fillColor: Hexcolor('#efba29'),
//   filled: true,
//   hintText: "Enter your email",
//   border: OutlineInputBorder(
//     borderRadius: BorderRadius.circular(10.0),
//   ),
// );
