import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/models/calc_theme.dart';
import 'package:flutter_calculator_3/settings/app_themes.dart';

class AppTheme extends InheritedWidget {
  AppTheme._({
    Key key,
    @required this.themeMode,
    @required Widget child,
    this.backgroundColor,
    this.displayTheme,
    this.keyTheme,
    this.drawerTheme,
  })  : assert(themeMode != null),
        assert(child != null),
        super(key: key, child: child);

  factory AppTheme({Key key, @required ThemeMode themeMode, @required Widget child}) {
    final CalcTheme calcTheme = (themeMode == ThemeMode.light) ? lightTheme : darkTheme;
    return AppTheme._(
      key: key,
      themeMode: themeMode,
      child: child,
      backgroundColor: calcTheme.backgroundColor,
      displayTheme: calcTheme.displayTheme,
      keyTheme: calcTheme.keyTheme,
      drawerTheme: calcTheme.drawerTheme,
    );
  }

  final ThemeMode themeMode;
  final Color backgroundColor;
  final CalcDisplayTheme displayTheme;
  final CalcKeyTheme keyTheme;
  final CalcDrawerTheme drawerTheme;

  static AppTheme of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AppTheme>();

  @override
  bool updateShouldNotify(AppTheme oldWidget) => themeMode != oldWidget.themeMode;
}
