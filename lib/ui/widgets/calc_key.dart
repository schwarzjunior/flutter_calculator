import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/models/calc_key_data.dart';

typedef CalcKeyCallback = void Function(CalcKeyData);

class CalcKey extends StatelessWidget {
  const CalcKey({Key key, this.keyData, this.onPressed, this.flex = 1}) : super(key: key);

  final CalcKeyData keyData;
  final CalcKeyCallback onPressed;
  final int flex;

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width / 4.0;

    return Container(
      width: size * flex,
      height: size,
      child: FlatButton(
        color: const Color(0xff2d2d2d),
        child: Text(
          keyData.key,
          style: Theme.of(context).textTheme.display2.copyWith(color: Colors.white54),
        ),
        onPressed: () => onPressed(keyData),
      ),
    );
  }
}
