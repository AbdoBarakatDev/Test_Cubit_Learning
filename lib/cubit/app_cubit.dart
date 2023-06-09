import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_cubit/cubit/app_states.dart';

class CounterController extends Cubit<CounterStates> {
  CounterController() : super(CounterInitialState());

  static CounterController get(BuildContext context) =>
      BlocProvider.of(context);

  int counterValue = 0;
  increaseCounter() {
    counterValue++;
    emit(CounterIncrementValueState());
  }

  decreaseCounter() {
    counterValue--;
    try {} catch (error) {
      emit(CounterErrorState(error.toString()));
    }
  }
}
