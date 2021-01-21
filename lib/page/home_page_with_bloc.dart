import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lesson_3/bloc/home_bloc.dart';
import 'package:flutter_lesson_3/bloc/home_event.dart';
import '../state/home_state.dart';

/// This is class is only an example on how use a BLOC instead of a CUBIT.
class HomePageStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Home page stateless'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<HomeBloc, HomeState>(
              buildWhen: (previousState, state) {
                /// Indicates when the BlocConsumer need to rebuild his widget tree on every state change.
                return true;
              },
              listenWhen: (previousState, state) {
                /// Indicates when the BlocConsumer need to react on every state change.
                return true;
              },
              listener: (context, state) {
                /// Called once every state change except the initial one.
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.wasIncremented ? 'Incremented' : 'Decremented',
                    ),
                    backgroundColor:
                    state.wasIncremented ? Colors.green : Colors.red,
                  ),
                );
              },
              builder: (context, state) {
                /// Called by the flutter engine several times.
                /// Need to wrap only the widget tree that need to react to the state changes.
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () => context.read<HomeBloc>().add(IncrementEvent()),
                  child: Icon(Icons.exposure_minus_1),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () => context.read<HomeBloc>().add(DecrementEvent()),
                  child: Icon(Icons.plus_one),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
