import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/models/calc_key_data.dart';
import 'package:flutter_calculator_3/ui/widgets/theme/app_theme.dart';

typedef CalcKeyCallback = void Function(CalcKeyData);

class CalcKey extends StatelessWidget {
  const CalcKey({Key key, this.keyData, this.onPressed, this.size, this.flex = 1}) : super(key: key);

  final CalcKeyData keyData;
  final CalcKeyCallback onPressed;
  final Size size;
  final int flex;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppTheme.of(context);
    // final double size = MediaQuery.of(context).size.width / 4.0;
    // final double size = MediaQuery.of(context).size.width / 5.0;
    // final Size size = MediaQuery.of(context).size;

    return Container(
      // width: size.width / 4 * flex,
      // height: size.width / 5,
      width: size.width * flex,
      height: size.height,
      child: FlatButton(
        // color: const Color(0xff2d2d2d),
        // color: appTheme.keyTheme.numberColor,
        color: _getColor(appTheme),
        child: Text(
          keyData.key,
          // style: Theme.of(context).textTheme.display2.copyWith(color: Colors.white54),
          style: appTheme.keyTheme.textStyle,
        ),
        onPressed: () => onPressed(keyData),
      ),
    );
  }

  Color _getColor(AppTheme appTheme) {
    if (keyData.isNumber) {
      return appTheme.keyTheme.numberColor;
    } else if (keyData.isOperator) {
      return appTheme.keyTheme.operatorColor;
    } else {
      return appTheme.keyTheme.functionColor;
    }
  }
}
