import 'package:counter/bloc/counter_bloc.dart';
import 'package:counter/bloc/counter_state.dart';
import 'package:counter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter App'),
      ),
      body: BlocConsumer<CounterBloc, CounterState>(
        listener: (context, state) {
          _controller.clear();
        },
        builder: (context, state) {
          final invalidValue =
              (state is CounterStateInValidNumber) ? state.invalidValue : '';

          return Column(
            children: [
              Text('Current Value => ${state.value}'),
              Visibility(
                child: Text('Invalid input: $invalidValue'),
                visible: state is CounterStateInValidNumber,
              ),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Enter a number here',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            // key: const Key('HomePage_decrement_floatingActionButton'),
            onPressed: () {
              context.read<CounterBloc>().add(DecrementEvent(_controller.text));
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            // key: const Key('HomePageState_increment_floatingActionButton'),
            onPressed: () {
              context.read<CounterBloc>().add(IncrementEvent(_controller.text));
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
