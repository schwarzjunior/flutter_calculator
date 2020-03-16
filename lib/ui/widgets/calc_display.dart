import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/ui/widgets/theme/app_theme.dart';

class CalcDisplay extends StatelessWidget {
  const CalcDisplay({Key key, this.displayText, this.equationText, this.height}) : super(key: key);

  final String displayText;
  final String equationText;
  final double height;

  double get _margin => (height / 10.0);

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppTheme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: _margin),
      constraints: BoxConstraints.expand(height: height),
      color: appTheme.displayTheme.displayColor,
      child: Container(
        padding: const EdgeInsets.all(32),
        constraints: BoxConstraints.expand(height: height - _margin),
        decoration: BoxDecoration(
          // color: Color(0xff2d2d2d),
          color: appTheme.displayTheme.displayColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              equationText ?? '',
              // style: Theme.of(context).textTheme.title.copyWith(color: Colors.white54),
              style: appTheme.displayTheme.equationTextStyle,
            ),
            Text(
              displayText ?? '',
              // style: Theme.of(context).textTheme.display2.copyWith(color: Colors.white70),
              style: appTheme.displayTheme.displayTextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
