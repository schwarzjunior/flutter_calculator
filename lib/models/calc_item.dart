class CalcItem {
  CalcItem._(String value, bool isResult)
      : assert(value != null && value.isNotEmpty),
        assert(isResult != null) {
    // mais de um caractere indica que se trata de um numero que, iniciando com '-' eh negativo
    this._isNegative = (value.length > 1 && value.startsWith('-'));
    // remove todos os caracteres '-' do inicio de value
    this._value = value.replaceFirst(RegExp(r'\-*'), '');
    this._isResult = _isNumber(this._value, !isResult) ? isResult : false;
    if (this._isResult != isResult) {
      throw FormatException(
          'The format of result number is incorrect'
          'Probably it ends with a decimal dot (.), or it has other characters than numbers',
          value);
    }
  }

  factory CalcItem.asNumber([String value = '0']) => CalcItem._(value, false);

  factory CalcItem.asResult(String value) => CalcItem._(value, true);

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
  String get valueAsText => value.replaceAllMapped(RegExp(r'[ASMDG]'), (m) => _symbolsTable[m.group(0)]);

  /// Retorna o valor do item corrigido
  /// (removendo ponto decimal do seu final, caso terminar com este).
  String get valueFixed => isOperator ? _value : value.replaceFirst(RegExp(r'\.$'), '');

  bool get isNumber => _isNumber(_value, true);

  bool get isOperator => _isOperator(_value);

  bool get isNegative => _isNegative;

  bool get isResult => _isResult;

  void process(String value) {
    if (isNumber) {
      if (value == '.') {
        if (!RegExp(r'\.').hasMatch(_value)) {
          _value += value;
        }
      } else if (_value == '0') {
        _value = value;
      } else {
        _value += value;
      }
    } else if (isOperator) {
      _changeOperator(value);
    }
  }

  /// Se [_value] for um numero, inverte o valor de [_isNegative].
  void toggleSign() => _isNegative = isNumber ? !_isNegative : _isNegative;

  /// Se [_value] for um operador, modifica o operador de [_value].
  void _changeOperator(String value) => _value = (isOperator && _isOperator(value)) ? value : _value;

  void undo() {}

  /// Checa se [value] corresponde a um numero.
  static bool _isNumber(String value, bool allowEndsWithDecimal) {
    final String pattern = allowEndsWithDecimal
        ? r'^\d+\.?\d*$' // pode terminal com ponto decimal (.)
        : r'^\d+\.?\d*\.?\b$'; // nao pode terminar com ponto decimal (.)
    return RegExp(pattern).hasMatch(value);
    // return RegExp(r'^\d+\.?\d*$').hasMatch(value);
  }

  /// Checa se [value] corresponde a um operator.
  static bool _isOperator(String value) {
    return RegExp(r'^[ASMD]$').hasMatch(value);
  }
}

const Map<String, String> _symbolsTable = {
  'A': ' + ',
  'S': ' - ',
  'M': ' x ',
  'D': ' ÷ ',
  'G': '-',
};
