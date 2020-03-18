import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/ui/widgets/theme/app_theme.dart';

class CalcDisplay extends StatelessWidget {
  const CalcDisplay({Key key, this.displayText, this.equationText, this.height}) : super(key: key);

  final String displayText;
  final String equationText;
  final double height;

  // double get _margin => (height / 20.0);
  double get _margin => (height / 10.0);
  // double get _margin => 0.0;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppTheme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: _margin),
      constraints: BoxConstraints.expand(height: height),
      color: appTheme.displayTheme.displayColor,
      child: Container(
        // padding: const EdgeInsets.all(32),
        margin: EdgeInsets.symmetric(horizontal: 32),
        alignment: Alignment.centerRight,
        // margin: EdgeInsets.zero,
        constraints: BoxConstraints.expand(height: height - _margin),
        decoration: BoxDecoration(
          // color: Color(0xff2d2d2d),
          color: appTheme.displayTheme.displayColor,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              equationText ?? '',
              style: appTheme.displayTheme.equationTextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
            ),
            Text(
              displayText ?? '',
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
