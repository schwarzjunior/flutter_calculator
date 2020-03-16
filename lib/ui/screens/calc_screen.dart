import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/blocs/calc_bloc.dart';
import 'package:flutter_calculator_3/blocs/calc_state.dart';
import 'package:flutter_calculator_3/ui/widgets/calc_display.dart';
import 'package:flutter_calculator_3/ui/widgets/calc_key_pad.dart';
import 'package:flutter_calculator_3/ui/widgets/theme/app_theme.dart';

class CalcScreen extends StatefulWidget {
  @override
  _CalcScreenState createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  CalcBloc _bloc;
  double _displayHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<CalcState>(
            stream: _bloc.outState,
            initialData: _bloc.initialState,
            builder: (context, snapshot) {
              return CalcDisplay(
                displayText: snapshot.data.display,
                equationText: snapshot.data.equation,
                height: _displayHeight,
              );
            },
          ),
          CalcKeyPad(bloc: _bloc),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    _bloc = CalcBloc(CalcState('0', ''));
    final Size screen = MediaQuery.of(context).size;
    final double buttonSize = screen.width / 4.0;
    _displayHeight = screen.height - (buttonSize * 5.0);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
