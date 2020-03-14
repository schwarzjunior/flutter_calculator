import 'package:flutter/material.dart';

class CalcDisplay extends StatelessWidget {
  const CalcDisplay({Key key, this.displayText, this.equationText, this.height}) : super(key: key);

  final String displayText;
  final String equationText;
  final double height;

  double get _margin => (height / 10.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: _margin),
      constraints: BoxConstraints.expand(height: height),
      child: Container(
        padding: const EdgeInsets.all(32),
        constraints: BoxConstraints.expand(height: height - _margin),
        decoration: BoxDecoration(
          color: Color(0xff2d2d2d),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              equationText ?? '',
              style: Theme.of(context).textTheme.title.copyWith(color: Colors.white54),
            ),
            Text(
              displayText ?? '',
              style: Theme.of(context).textTheme.display2.copyWith(color: Colors.white70),
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
