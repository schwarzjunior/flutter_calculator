import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/ui/widgets/theme/app_theme.dart';

typedef ChangeCalcMode = void Function(bool);

class CalcDrawer extends StatelessWidget {
  const CalcDrawer({Key key, @required this.changeMode}) : super(key: key);

  final ChangeCalcMode changeMode;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppTheme.of(context);

    // print(Theme.of(context).textTheme.body1);

    /// Cria um novo item do drawer.
    Widget createDrawerItem(String text, Function onTap) {
      return ListTile(
        title: Text(text, style: appTheme.drawerTheme.itemTextStyle),
        onTap: () {
          Navigator.of(context).pop();
          onTap();
        },
      );
    }

    // Widgets exibidos no dialog about do app
    final List<Widget> aboutChildren = <Widget>[
      const SizedBox(height: 24.0),
      RichText(
        // textAlign: TextAlign.justify,
        text: TextSpan(
          style: appTheme.drawerTheme.aboutDialogTextStyle,
          children: <TextSpan>[
            TextSpan(
                text: 'Flutter Calculator has two calculator modes, '
                    'the Simple and the Scientific modes.\n\n'),
            TextSpan(
                text: 'https://github.com/schwarzjunior/flutter_calculator',
                style: appTheme.drawerTheme.aboutDialogTextStyle.copyWith(
                  color: Theme.of(context).accentColor,
                  fontSize: 12.0,
                )),
            TextSpan(text: '.'),
          ],
        ),
      ),
    ];

    return Drawer(
      child: Container(
        color: appTheme.drawerTheme.backgroundColor,
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: appTheme.drawerTheme.headerColor),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 12.0,
                    left: 16.0,
                    child: Text('Flutter Calculator', style: appTheme.drawerTheme.headerTextStyle),
                  ),
                ],
              ),
            ),
            createDrawerItem('Simple', () => changeMode(true)),
            createDrawerItem('Scientific', () => changeMode(false)),
            // AboutListTile
            SafeArea(
              child: AboutListTile(
                icon: Icon(Icons.info_outline, color: appTheme.drawerTheme.aboutIconColor),
                child: Text('Flutter Calculator', style: appTheme.drawerTheme.aboutTextStyle),
                applicationName: 'Flutter Calculator',
                applicationVersion: 'March 2020',
                applicationLegalese: '2020 Carlos R. Schwarz',
                aboutBoxChildren: aboutChildren,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
