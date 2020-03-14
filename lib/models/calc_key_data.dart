enum CalcKeyType { NUMBER, OPERATOR, FUNCTION }

class CalcKeyData {
  const CalcKeyData._(this.index, this.key, this._type);

  final int index;
  final String key;
  final CalcKeyType _type;

  bool get isNumber => this._type == CalcKeyType.NUMBER;

  bool get isOperator => this._type == CalcKeyType.OPERATOR;

  bool get isFunction => this._type == CalcKeyType.FUNCTION;

  static const CalcKeyData zero = const CalcKeyData._(0, '0', CalcKeyType.NUMBER);
  static const CalcKeyData one = const CalcKeyData._(1, '1', CalcKeyType.NUMBER);
  static const CalcKeyData two = const CalcKeyData._(2, '2', CalcKeyType.NUMBER);
  static const CalcKeyData three = const CalcKeyData._(3, '3', CalcKeyType.NUMBER);
  static const CalcKeyData four = const CalcKeyData._(4, '4', CalcKeyType.NUMBER);
  static const CalcKeyData five = const CalcKeyData._(5, '5', CalcKeyType.NUMBER);
  static const CalcKeyData six = const CalcKeyData._(6, '6', CalcKeyType.NUMBER);
  static const CalcKeyData seven = const CalcKeyData._(7, '7', CalcKeyType.NUMBER);
  static const CalcKeyData eight = const CalcKeyData._(8, '8', CalcKeyType.NUMBER);
  static const CalcKeyData nine = const CalcKeyData._(9, '9', CalcKeyType.NUMBER);
  static const CalcKeyData decimal = const CalcKeyData._(10, '.', CalcKeyType.NUMBER);

  static const CalcKeyData add = const CalcKeyData._(11, '+', CalcKeyType.OPERATOR);
  static const CalcKeyData subtract = const CalcKeyData._(12, '-', CalcKeyType.OPERATOR);
  static const CalcKeyData multiply = const CalcKeyData._(13, 'x', CalcKeyType.OPERATOR);
  static const CalcKeyData divide = const CalcKeyData._(14, '÷', CalcKeyType.OPERATOR);

  static const CalcKeyData equals = const CalcKeyData._(15, '=', CalcKeyType.FUNCTION);
  static const CalcKeyData clear = const CalcKeyData._(16, 'C', CalcKeyType.FUNCTION);
  static const CalcKeyData sign = const CalcKeyData._(17, '±', CalcKeyType.FUNCTION);
  static const CalcKeyData percent = const CalcKeyData._(18, '%', CalcKeyType.FUNCTION);
  static const CalcKeyData undo = const CalcKeyData._(19, '<', CalcKeyType.FUNCTION);

  static const List<CalcKeyData> values = const <CalcKeyData>[
    zero, one, two, three, four, five, six, seven, eight, nine, decimal,
    add, subtract, multiply, divide, equals, clear, sign, percent, undo
  ];

  @override
  String toString() => this.key;
}
