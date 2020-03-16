import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/ui/screens/calc_screen.dart';
import 'package:flutter_calculator_3/ui/widgets/theme/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator 3',
      theme: ThemeData(primarySwatch: Colors.teal),
      themeMode: ThemeMode.system,
      home: Builder(
        builder: (context) {
          final ThemeMode themeMode = (MediaQuery.of(context).platformBrightness == Brightness.light)
              ? ThemeMode.light
              : ThemeMode.dark;
          return AppTheme(themeMode: themeMode, child: CalcScreen(simple: true));
        },
      ),
    );
  }
}
