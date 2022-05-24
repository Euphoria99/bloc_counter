import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:counter/bloc/counter_state.dart';

@immutable
abstract class CounterEvent {
  final String value;
  const CounterEvent(this.value);
}

class IncrementEvent extends CounterEvent {
  const IncrementEvent(String value) : super(value);
}

class DecrementEvent extends CounterEvent {
  const DecrementEvent(String value) : super(value);
}
