import 'package:flutter/material.dart';
import 'package:flutter_calculator_3/blocs/calc_bloc.dart';
import 'package:flutter_calculator_3/blocs/calc_state.dart';
import 'package:flutter_calculator_3/ui/widgets/calc_display.dart';
import 'package:flutter_calculator_3/ui/widgets/calc_key_pad.dart';

class CalcSimpleScreen extends StatefulWidget {
  const CalcSimpleScreen(this.mediaQueryData, {Key key}) : super(key: key);

  final MediaQueryData mediaQueryData;

  @override
  _CalcSimpleScreenState createState() => _CalcSimpleScreenState();
}

class _CalcSimpleScreenState extends State<CalcSimpleScreen> {
  CalcBloc _bloc;
  double _displayHeight;

  MediaQueryData get mediaQueryData => widget.mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
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
          CalcKeyPad(bloc: _bloc),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    _bloc = CalcBloc(CalcState('0', ''));
    final double containerHeight = mediaQueryData.size.height - mediaQueryData.padding.top;
    final double buttonSize = mediaQueryData.size.width / 4.0;
    _displayHeight = containerHeight - (buttonSize * 5.0) - kToolbarHeight;
    super.didChangeDependencies();
  }

  /* @override
  void didChangeDependencies() {
    _bloc = CalcBloc(CalcState('0', ''));
    final Size screenSize = MediaQuery.of(context).size;
    final EdgeInsets padding = MediaQuery.of(context).padding;
    final double containerHeight = screenSize.height - padding.top;
    print('paddingTop: ${padding.top}');
    print('height: ${screenSize.height}');
    // final double buttonSize = (screenSize.width / 4.0).toInt().toDouble();
    final double buttonSize = (screenSize.width / 4.0).roundToDouble();
    print('buttonSize: $buttonSize');
    _displayHeight = (containerHeight - (buttonSize * 5) - kToolbarHeight).truncateToDouble();
    print('displayHeight: $_displayHeight');
    super.didChangeDependencies();
  } */

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
