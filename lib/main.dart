import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/ui/screens/calc_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator 3',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: CalcScreen(),
    );
  }
}
