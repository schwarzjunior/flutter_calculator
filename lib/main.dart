import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/ui/screens/calc_scientific_screen.dart';
import 'package:flutter_calculator_3/ui/screens/calc_screen.dart';
import 'package:flutter_calculator_3/ui/screens/calc_simple_screen.dart';
import 'package:flutter_calculator_3/ui/widgets/calc_drawer.dart';
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
          return AppTheme(
            themeMode: themeMode,
            // child: CalcScreen(simple: false),
            child: CalcMainScreen(),
          );
        },
      ),
    );
  }
}

class CalcMainScreen extends StatefulWidget {
  @override
  _CalcMainScreenState createState() => _CalcMainScreenState();
}

class _CalcMainScreenState extends State<CalcMainScreen> {
  MediaQueryData _mediaQueryData;
  double _statusBarHeight;
  double _availableHeight;
  Size _availableScreenSize;
  bool _simpleMode = true;

  void _changeMode(bool simpleMode) {
    setState(() {
      _simpleMode = simpleMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),
      drawer: CalcDrawer(changeMode: _changeMode),
      body: _simpleMode ? CalcSimpleScreen(_mediaQueryData) : CalcScientificScreen(_mediaQueryData),
      // body: ,
    );
  }

  @override
  void didChangeDependencies() {
    _mediaQueryData = MediaQuery.of(context);
    _statusBarHeight = _mediaQueryData.padding.top;
    _availableHeight = _mediaQueryData.size.height - _statusBarHeight - kToolbarHeight;
    _availableScreenSize = Size(_mediaQueryData.size.width, _availableHeight);
    super.didChangeDependencies();
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(context),
          _createDrawerItem(
            text: 'Simple',
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CalcScreen(simple: true),
              ),
            ),
          ),
          _createDrawerItem(
            text: 'Scientific',
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CalcScreen(simple: true),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createHeader(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text(
              'Flutter Calculator',
              style: Theme.of(context).textTheme.headline.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Text(text),
      onTap: onTap,
    );
  }
}
