abstract class CounterStates {}

class CounterInitialState extends CounterStates {}

class CounterIncrementValueState extends CounterStates {}

class CounterDecrementValueState extends CounterStates {}

class CounterErrorState extends CounterStates {
  final String? error;
  CounterErrorState(this.error);
}
