import 'dart:async';

import 'package:flutter_calculator_3/blocs/calc_state.dart';
import 'package:flutter_calculator_3/controller/calc_controller.dart';
import 'package:flutter_calculator_3/models/calc_key_data.dart';

class CalcBloc {
  CalcBloc([CalcState initialState])
      : this.initialState = initialState ?? CalcState('0', ''),
        this._calculator = CalcController();

  final CalcState initialState;
  final CalcController _calculator;

  final StreamController<CalcState> _stateController = StreamController<CalcState>();

  Stream<CalcState> get outState => _stateController.stream;

  void fireKey(CalcKeyData keyData) {
    _calculator.process(keyData);
    _send(_calculator.display, _calculator.equationDisplay);
  }

  void _send([String display, String equation]) => _stateController.add(CalcState(display, equation));

  void dispose() {
    _stateController.close();
  }
}
