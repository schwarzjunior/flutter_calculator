import 'package:flutter/material.dart';

class CalcTheme {
  const CalcTheme({
    this.backgroundColor,
    this.displayTheme,
    this.keyTheme,
    this.drawerTheme,
  });

  final Color backgroundColor;
  final CalcDisplayTheme displayTheme;
  final CalcKeyTheme keyTheme;
  final CalcDrawerTheme drawerTheme;
}

class CalcDrawerTheme {
  const CalcDrawerTheme({
    this.backgroundColor,
    this.headerColor,
    this.headerTextStyle,
    this.itemTextStyle,
    this.aboutTextStyle,
    this.aboutDialogTextStyle,
    this.aboutIconColor,
  });

  final Color backgroundColor;
  final Color headerColor;
  final TextStyle headerTextStyle;
  final TextStyle itemTextStyle;
  final TextStyle aboutTextStyle;
  final TextStyle aboutDialogTextStyle;
  final Color aboutIconColor;
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
