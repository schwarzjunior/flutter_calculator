const int kPrecisionSize = 12;

const String _pMinusSign = r'\-*';
const String _pOperatorsAndSign = r'[ASMDG]';
const String _pEndsWithDecimal = r'\.$';
const String _pDecimal = r'\.';
const String _pPositiveNumberFull = r'^\d+\.?\d*\.?\b$';
const String _pPositiveNumberAllowLastDecimalFull = r'^\d+\.?\d*$';
const String _pOperatorsFull = r'^[ASMD]$';

class CalcItem {
  CalcItem._(String value, bool isResult)
      : assert(value != null && value.isNotEmpty),
        assert(isResult != null) {
    // mais de um caractere indica que se trata de um numero que, iniciando com '-' eh negativo
    this._isNegative = (value.length > 1 && value.startsWith('-'));
    // remove todos os caracteres '-' do inicio de value
    // this._value = value.replaceFirst(RegExp(_pMinusSign), '');
    this._value = (!isResult && !_isOperator(value) && value == '.')
        ? '0.'
        : value.replaceFirst(RegExp(_pMinusSign), '');
    this._isResult = _isNumber(this._value, !isResult) ? isResult : false;
    if (this._isResult != isResult) {
      throw FormatException(
          'The format of result number is incorrect'
          'Probably it ends with a decimal dot (.), or it has other characters than numbers',
          value);
    }
  }

  /// Cria um novo [CalcItem] representando um numero.
  factory CalcItem.asNumber([String value = '0']) => CalcItem._(value, false);

  /// Cria um novo [CalcItem] representando o resultado de um calculo.
  factory CalcItem.asResult(String value) => CalcItem._(value, true);

  /// Cria um novo [CalcItem] representando um operador.
  factory CalcItem.asOperator(String value) => CalcItem._(value, false);

  String _value;
  bool _isNegative;
  bool _isResult;

  /// Retorna o valor do item.
  ///
  /// No caso de o item ser um numero negativo, este iniciara com a flag 'G' de sign.
  String get value => (isNumber && _isNegative) ? 'G$_value' : _value;

  /// Retorna o valor do item formatado para visualizacao
  /// (substituindo as flags por simbolos matematicos).
  String get valueAsText =>
      value.replaceAllMapped(RegExp(_pOperatorsAndSign), (m) => _symbolsTable[m.group(0)]);

  /// Retorna o valor do item corrigido
  /// (removendo ponto decimal do seu final, caso terminar com este).
  String get valueFixed => isOperator ? _value : value.replaceFirst(RegExp(_pEndsWithDecimal), '');

  /// Checa se o valor do item representa um numero, permitindo que
  /// este termine com um ponto decimal.
  bool get isNumber => _isNumber(_value, true);

  /// Checa se o valor do item representa um operador.
  bool get isOperator => _isOperator(_value);

  /// Retorna true se o valor do item representa um numero e for negativo.
  bool get isNegative => _isNegative;

  /// Retorna true se o valor do item representa o resultado de um calculo.
  bool get isResult => _isResult;

  /// Consolida o valor do item.
  ///
  /// Se o item for um numero inteiro, remove o ponto decimal e os zeros seguintes.
  void consolidateValue() => _value = !isNumber ? _value : _consolidateNumber(_value);

  /// Processa o valor de [value].
  ///
  /// - Se [value] for um numero, atualiza o valor do item atual com o novo valor.
  /// - Se [value] for um operador, substitui o valor do item atual pelo novo.
  void process(String value) {
    if (isNumber) {
      if (value == '.') {
        if (!RegExp(_pDecimal).hasMatch(_value)) {
          // So adiciona o ponto decimal caso o valor do item atual ja nao contiver um
          _value += value;
        }
      } else if (_value == '0') {
        // Se o valor do item atual for zero, este sera completamente substituido pelo novo
        _value = value;
      } else {
        // Adicionando o novo valor ao item atual
        _value += value;
      }
    } else if (isOperator) {
      // Substituindo o operador do item atual pelo novo
      _changeOperator(value);
    }
  }

  /// Se [_value] for um numero, inverte o valor de [_isNegative].
  void toggleSign() => _isNegative = isNumber ? !_isNegative : _isNegative;

  /// Se [_value] for um operador, modifica o operador de [_value].
  void _changeOperator(String value) => _value = (isOperator && _isOperator(value)) ? value : _value;

  void undo() {
    if (isOperator) return;

    if (isResult || _value.length == 1) {
      _value = '0';
    } else {
      _value = _value.substring(0, _value.length - 1);
    }
  }

  /// Checa se [value] corresponde a um numero.
  static bool _isNumber(String value, bool allowEndsWithDecimal) {
    return RegExp(allowEndsWithDecimal ? _pPositiveNumberAllowLastDecimalFull : _pPositiveNumberFull)
        .hasMatch(value);
  }

  /// Checa se [value] corresponde a um operator.
  static bool _isOperator(String value) {
    return RegExp(_pOperatorsFull).hasMatch(value);
  }

  static String _consolidateNumber(String value) {
    return num.parse(num.parse(value).toStringAsPrecision(kPrecisionSize))
        .toString()
        .replaceFirstMapped(RegExp(r'\.0+$'), (_) => '');
  }
}

const Map<String, String> _symbolsTable = {
  'A': ' + ',
  'S': ' - ',
  'M': ' x ',
  'D': ' ÷ ',
  'G': '-',
};
