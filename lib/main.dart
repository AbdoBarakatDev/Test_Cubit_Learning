import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_cubit/cubit/app_states.dart';

import 'bloc_observer.dart';
import 'cubit/app_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterController>(
      create: (context) => CounterController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TestCubitApp(),
      ),
    );
  }
}

class TestCubitApp extends StatelessWidget {
  const TestCubitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<CounterController, CounterStates>(
            listener: (context, state) {
          if (state is CounterErrorState) {}
        }, builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (state is CounterIncrementValueState)
                  ? const SizedBox(
                      width: 50, height: 50, child: CircularProgressIndicator())
                  : MaterialButton(
                      onPressed: () {
                        CounterController.get(context).increaseCounter();
                      },
                      child: Text("+"),
                    ),
              Text(CounterController.get(context).counterValue.toString()),
              MaterialButton(
                onPressed: () {
                  CounterController.get(context).decreaseCounter();
                },
                child: Text("-"),
              ),
            ],
          );
        }),
      ),
    );
  }
}
