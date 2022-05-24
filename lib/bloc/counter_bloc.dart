import 'package:bloc/bloc.dart';
import 'package:counter/bloc/counter_event.dart';
import 'package:counter/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterStateValid(0)) {
    on<IncrementEvent>((event, emit) {
      final integer = int.tryParse(event.value);
      if (integer == null) {
        emit(
          CounterStateInValidNumber(
            invalidValue: event.value,
            previousValue: state.value,
          ),
        );
      } else {
        emit(
          CounterStateValid(state.value + integer),
        );
      }
    });
    on<DecrementEvent>(
      (event, emit) {
        final integer = int.tryParse(event.value);
        if (integer == null) {
          emit(
            CounterStateInValidNumber(
              invalidValue: event.value,
              previousValue: state.value,
            ),
          );
        } else {
          emit(
            CounterStateValid(state.value - integer),
          );
        }
      },
    );
  }
}
