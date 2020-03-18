import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/models/calc_theme.dart';

///
/// Light [CalcTheme].
///
const CalcTheme lightTheme = const CalcTheme(
  backgroundColor: const Color(0xff6b7389),
  displayTheme: const CalcDisplayTheme(
    displayColor: const Color(0xffdbdbdb),
    displayTextStyle: const TextStyle(
      color: const Color(0xff455a64),
      fontSize: 46.0,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
    equationTextStyle: const TextStyle(
      color: const Color(0x99455a64),
      fontSize: 20.0,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
  ),
  keyTheme: const CalcKeyTheme(
    numberColor: const Color(0xffc6c6c6),
    operatorColor: const Color(0xff3084b2),
    functionColor: const Color(0xff848484),
    textStyle: const TextStyle(
      color: const Color(0xff000000),
      shadows: <Shadow>[
        const Shadow(
          offset: const Offset(-1, 1),
          color: const Color(0x99ffffff),
          blurRadius: 2.0,
        ),
      ],
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
  ),
  drawerTheme: const CalcDrawerTheme(
    // backgroundColor: const Color(0xffb0c1e5),
    backgroundColor: const Color(0xffb9e5e5),
    headerColor: const Color(0xffdbdbdb),
    headerTextStyle: const TextStyle(
      color: const Color(0xff455a64),
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
    itemTextStyle: const TextStyle(
      color: const Color(0xff455a64),
      fontSize: 16.0,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
    aboutTextStyle: const TextStyle(
      color: const Color(0x99455a64),
      fontSize: 14.0,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
    aboutDialogTextStyle: const TextStyle(
      color: const Color(0xdd000000),
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
    aboutIconColor: const Color(0x99455a64),
  ),
);

///
/// Dark [CalcTheme].
///
const CalcTheme darkTheme = const CalcTheme(
  backgroundColor: const Color(0xff565e70),
  displayTheme: const CalcDisplayTheme(
    displayColor: const Color(0xff2d2d2d),
    displayTextStyle: const TextStyle(
      color: const Color(0xffffffff),
      fontSize: 46.0,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
    equationTextStyle: const TextStyle(
      color: const Color(0x99ffffff),
      fontSize: 20.0,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
  ),
  keyTheme: const CalcKeyTheme(
    numberColor: const Color(0xff444444),
    operatorColor: const Color(0xff1b4b66),
    functionColor: const Color(0xff262626),
    textStyle: const TextStyle(
      color: const Color(0xffffffff),
      shadows: <Shadow>[
        const Shadow(
          offset: const Offset(-1, 1),
          color: const Color(0x99ffffff),
          blurRadius: 2.0,
        ),
      ],
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
  ),
  drawerTheme: const CalcDrawerTheme(
    backgroundColor: const Color(0xff565e70),
    headerColor: const Color(0xff2d2d2d),
    headerTextStyle: const TextStyle(
      color: const Color(0x99ffffff),
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
    itemTextStyle: const TextStyle(
      color: const Color(0xffffffff),
      fontSize: 16.0,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
    aboutTextStyle: const TextStyle(
      color: const Color(0x99ffffff),
      fontSize: 14.0,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
    aboutDialogTextStyle: const TextStyle(
      color: const Color(0xdd000000),
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
    aboutIconColor: const Color(0x99ffffff),
  ),
);
