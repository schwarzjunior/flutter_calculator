import 'package:flutter/material.dart';

class CalcTheme {
  const CalcTheme({
    this.backgroundColor,
    this.displayTheme,
    this.keyTheme,
  });

  final Color backgroundColor;
  final CalcDisplayTheme displayTheme;
  final CalcKeyTheme keyTheme;
}

class CalcDisplayTheme {
  const CalcDisplayTheme({
    this.displayColor,
    this.displayTextStyle,
    this.equationTextStyle,
  });

  final Color displayColor;
  final TextStyle displayTextStyle;
  final TextStyle equationTextStyle;
}

class CalcKeyTheme {
  const CalcKeyTheme({
    this.numberColor,
    this.operatorColor,
    this.functionColor,
    this.textStyle,
  });

  final Color numberColor;
  final Color operatorColor;
  final Color functionColor;
  final TextStyle textStyle;
}
