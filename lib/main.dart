import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui_part_01/screen/LandingScreen.dart';
import 'package:flutter_ui_part_01/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      title: 'Flutter UI Part 01',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: COLOR_WHITE,
          accentColor: COLOR_DARK_BLUE,
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: "Montserrat"),
      home: const LandingScreen(),
    );
  }
}
