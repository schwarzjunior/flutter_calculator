import 'package:flutter_calculator_3/models/calc_item.dart';
import 'package:flutter_calculator_3/models/calc_key_data.dart';

typedef _CalcFn = num Function(num, num);

const String _SIGN = 'G';
const String _EQUALS = 'E';
const String _ADD = 'A';
const String _SUBTRACT = 'S';
const String _MULTIPLY = 'M';
const String _DIVIDE = 'D';

const Map<String, _CalcFn> _operationsTable = {
  _ADD: _addOperation,
  _SUBTRACT: _subtractOperation,
  _MULTIPLY: _multiplyOperation,
  _DIVIDE: _divideOperation,
};

num _addOperation(a, b) => (a + b);
num _subtractOperation(a, b) => (a - b);
num _multiplyOperation(a, b) => (a * b);
num _divideOperation(a, b) => (a / b);

const Map<CalcKeyData, String> _keysTable = {
  CalcKeyData.add: 'A',
  CalcKeyData.subtract: 'S',
  CalcKeyData.multiply: 'M',
  CalcKeyData.divide: 'D',
};

class CalcController {
  String _equation = '';
  String _equationDisplay = '';
  CalcItem _item = CalcItem.asNumber();

  String get equation => _equation;

  String get equationDisplay {
    if (_item.isOperator) {
      return '$_equationDisplay${_item.valueAsText}';
    } else {
      return _equationDisplay;
    }
  }

  String get display {
    if (_item.isNumber) {
      return _item.valueAsText;
    } else {
      return '0';
    }
  }

  void _solve() {
    _equationDisplay += _item.valueAsText;
    _equation += _item.valueFixed;

    String calc = _equation;

    Match match = _nextOperation(calc);
    while (match != null) {
      calc = calc.replaceFirstMapped(match.pattern, (m) => _calculate(m.group(0)));
      match = _nextOperation(calc);
    }

    _item = CalcItem.asResult(calc);
  }

  String _calculate(String calc) {
    final String pattern = r'(\G?\d+\.?\d*)([ASMD])(\G?\d+\.?\b\d*)';
    final RegExpMatch match = RegExp(pattern).allMatches(calc).elementAt(0);

    final String o = match.group(2);
    final String a = match.group(1);
    final String b = match.group(3);

    final num result = _operationsTable[o](_expToNum(a), _expToNum(b));

    return _toStringPrecision(result);
  }

  void process(CalcKeyData key) {
    if (key.isNumber) {
      _handleNumber(key);
    } else if (key.isOperator) {
      _handleOperator(key);
    } else if (key.isFunction) {
      _handleFunction(key);
    }
  }

  void _handleNumber(CalcKeyData key) {
    if (_item.isOperator) {
      // adicionando o operador do item atual a equacao
      _equationDisplay += _item.valueAsText;
      _equation += _item.valueFixed;
      _item = CalcItem.asNumber(key.key);
    } else if (_item.isResult) {
      // iniciando um novo calculo
      _fnClear();
      _item = CalcItem.asNumber(key.key);
    } else {
      // item atual eh um numero, processando o novo valor
      _item.process(key.key);
    }
  }

  void _handleOperator(CalcKeyData key) {
    if (_item.isNumber) {
      // adicionando o numero do item atual a equacao
      if (_item.isResult) {
        // substituindo a equacao pelo resultado do calculo anterior em item
        _equationDisplay = _item.valueAsText;
        _equation = _item.valueFixed;
      } else {
        // ajustando o numero atual antes de adiciona-lo a equacao
        _item.consolidateValue();
        // adicionando o numero atual a equacao
        _equationDisplay += _item.valueAsText;
        _equation += _item.valueFixed;
      }
      // criando o novo item com o operador
      _item = CalcItem.asOperator(_keysTable[key]);
    } else {
      // item atual ja eh um operador, e sera substituido pelo novo
      _item.process(_keysTable[key]);
    }
  }

  void _handleFunction(CalcKeyData key) {
    if (key == CalcKeyData.equals) {
      _solve();
    } else if (key == CalcKeyData.undo) {
      _fnUndo();
    } else if (key == CalcKeyData.sign) {
      _fnSign();
    } else if (key == CalcKeyData.clear) {
      _fnClear();
    }
  }

  void _fnSign() {
    _item.toggleSign();
  }

  void _fnClear() {
    _equationDisplay = '';
    _equation = '';
    _item = CalcItem.asNumber();
  }

  void _fnUndo() {
    _item.undo();
  }

  /// Retorna o proximo calculo da equacao a ser executado, respeitando as prioridades
  /// dos operadores de multiplicacao e divisao, sobre a adicao e a subtracao.
  static Match _nextOperation(String calc) {
    // Checa se existe algum operador prioritario na equacao
    final bool hasPriority = RegExp(r'[MD]').hasMatch(calc);

    final String pattern = hasPriority ? r'G?\d+\.?\d*[MD]G?\d+\.?\b\d*' : r'G?\d+\.?\d*[AS]G?\d+\.?\b\d*';
    return RegExp(pattern).firstMatch(calc);
  }

  /// Converte uma expressao, [value], para o seu valor numerico correspondente,
  /// substituindo o caractere 'G' pelo sinal de menos (-) quando necessario.
  static num _expToNum(String value) => num.parse(value.replaceFirstMapped(RegExp(r'^G'), (m) => '-'));

  /// Converte o num [value] em um string, removendo o ponto decimal e/ou o(s) zero(s) do seu
  /// final quando o valor de [value] eh um inteiro.
  static String _toStringPrecision(num value) => num.parse(value.toStringAsPrecision(kPrecisionSize))
      .toString()
      .replaceFirstMapped(RegExp(r'\.0+$'), (_) => '');
}
