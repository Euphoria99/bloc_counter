import 'package:flutter/foundation.dart';

@immutable
abstract class CounterState {
  final int value;
  const CounterState(this.value);
}

class CounterStateValid extends CounterState {
  const CounterStateValid(int value) : super(value);
}

class CounterStateInValidNumber extends CounterState {
  final String invalidValue;
  const CounterStateInValidNumber({
    required this.invalidValue,
    required int previousValue,
  }) : super(previousValue);
}
