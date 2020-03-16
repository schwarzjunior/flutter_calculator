import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/models/calc_theme.dart';

const CalcTheme lightTheme = const CalcTheme(
  backgroundColor: const Color(0xff6b7389),
  displayTheme: const CalcDisplayTheme(
    displayColor: const Color(0xffdbdbdb),
    displayTextStyle: const TextStyle(
      color: const Color(0xff455a64),
      fontSize: 34.0,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
    equationTextStyle: const TextStyle(
      color: const Color(0x99455a64),
      fontSize: 22.0,
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
);

const CalcTheme darkTheme = const CalcTheme(
  backgroundColor: const Color(0xff565e70),
  displayTheme: const CalcDisplayTheme(
    displayColor: const Color(0xff2d2d2d),
    displayTextStyle: const TextStyle(
      color: const Color(0xffffffff),
      fontSize: 34.0,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
      decoration: TextDecoration.none,
    ),
    equationTextStyle: const TextStyle(
      color: const Color(0x99ffffff),
      fontSize: 22.0,
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
);
