import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/blocs/calc_bloc.dart';
import 'package:flutter_calculator_3/models/calc_key_data.dart';
import 'package:flutter_calculator_3/ui/widgets/calc_key.dart';

class CalcKeyPad extends StatelessWidget {
  const CalcKeyPad({Key key, this.bloc}) : super(key: key);

  final CalcBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _makeKey(CalcKeyData.clear),
            _makeKey(CalcKeyData.percent),
            _makeKey(CalcKeyData.undo),
            _makeKey(CalcKeyData.divide),
          ],
        ),
        Row(
          children: <Widget>[
            _makeKey(CalcKeyData.seven),
            _makeKey(CalcKeyData.eight),
            _makeKey(CalcKeyData.nine),
            _makeKey(CalcKeyData.multiply),
          ],
        ),
        Row(
          children: <Widget>[
            _makeKey(CalcKeyData.four),
            _makeKey(CalcKeyData.five),
            _makeKey(CalcKeyData.six),
            _makeKey(CalcKeyData.subtract),
          ],
        ),
        Row(
          children: <Widget>[
            _makeKey(CalcKeyData.one),
            _makeKey(CalcKeyData.two),
            _makeKey(CalcKeyData.three),
            _makeKey(CalcKeyData.add),
          ],
        ),
        Row(
          children: <Widget>[
            _makeKey(CalcKeyData.sign),
            _makeKey(CalcKeyData.zero),
            _makeKey(CalcKeyData.decimal),
            _makeKey(CalcKeyData.equals),
          ],
        ),
      ],
    );
  }

  void _fire(CalcKeyData keyData) => bloc.fireKey(keyData);

  CalcKey _makeKey(CalcKeyData keyData, [int flex = 1]) =>
      CalcKey(keyData: keyData, onPressed: _fire, flex: flex);
}
