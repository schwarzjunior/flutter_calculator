import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/blocs/calc_bloc.dart';
import 'package:flutter_calculator_3/blocs/calc_state.dart';
import 'package:flutter_calculator_3/ui/widgets/calc_display.dart';
import 'package:flutter_calculator_3/ui/widgets/calc_key_pad_scientific.dart';

class CalcScientificScreen extends StatefulWidget {
  const CalcScientificScreen(this.mediaQueryData, {Key key}) : super(key: key);

  final MediaQueryData mediaQueryData;

  @override
  _CalcScientificScreenState createState() => _CalcScientificScreenState();
}

class _CalcScientificScreenState extends State<CalcScientificScreen> {
  CalcBloc _bloc;
  double _displayHeight;

  MediaQueryData get mediaQueryData => widget.mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
          CalcKeyPadScientific(bloc: _bloc),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    _bloc = CalcBloc(CalcState('0', ''));
    final double containerHeight = mediaQueryData.size.height - mediaQueryData.padding.top;
    final double buttonSize = mediaQueryData.size.width / 5.0;
    _displayHeight = containerHeight - (buttonSize * 6.0) - kToolbarHeight;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
