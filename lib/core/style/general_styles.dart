import 'package:flutter/material.dart';

class GeneralStyle{

  static const Color themeMainColor = Colors.pink;
  static const Color themeSecondaryColor = Colors.pinkAccent;

  static const Color themeMasterBackgroundColor = Colors.white;
  static const Color themeInversedBackgroundColor = Colors.black;

  static const Color themeLayer0BackgroundColor = Colors.grey;
  static Color? themeLayer01BackgroundColor = Colors.grey[100];
  static Color? themeLayer02BackgroundColor = Colors.grey[200];
  static Color? themeLayer03BackgroundColor = Colors.grey[300];
  static Color? themeLayer04BackgroundColor = Colors.grey[400];



  static const TextStyle buttonHeadingTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static const TextStyle lightSmallDescriptionTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Roboto',
  );
  static const TextStyle headingTextStyle = TextStyle(
    color: themeInversedBackgroundColor,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
  );
  static const TextStyle smallHeadingTextStyle = TextStyle(
    color: themeInversedBackgroundColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
  );
  static const TextStyle smallThemeHeadingTextStyle = TextStyle(
    color: themeMainColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
  );
  static const TextStyle descriptionTextStyle = TextStyle(
    color: Colors.blueGrey,
    fontSize: 18,
    fontFamily: 'Roboto',
  );
  static const TextStyle smallDescriptionTextStyle = TextStyle(
    color: Colors.blueGrey,
    fontSize: 16,
    fontFamily: 'Roboto',
  );
  static const normalTextStyle = TextStyle(
    color: themeInversedBackgroundColor,
    fontSize: 20,
    fontFamily: 'Roboto',
  );
  static const mediumNormalTextStyle = TextStyle(
    color: themeInversedBackgroundColor,
    fontSize: 18,
    fontFamily: 'Roboto',
  );
  static const smallInversedColorTextStyle = TextStyle(
    color: themeMasterBackgroundColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
  );
}