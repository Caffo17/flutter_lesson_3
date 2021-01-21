import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lesson_3/cubit/home_cubit.dart';
import 'package:flutter_lesson_3/page/home_page_stateless.dart';
import 'package:flutter_lesson_3/state/home_state.dart';

/// HomePage like a StatefulWidget.
class HomePageStateful extends StatefulWidget {
  HomePageStateful({Key key}) : super(key: key);

  @override
  _HomePageStatefulState createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {
  /// The instance of the `HomePage`'s "brain".
  HomeCubit _cubit;

  @override
  void initState() {
    /// Different way to get the needed cubit from the parent widget tree.
    /// Using the `BuildContext extension provided by flutter_bloc.
    // _cubit = context.read<HomeCubit>();
    /// Using the `BlocProvider`'s method inherited from the `InheritedWidget`.
    _cubit = BlocProvider.of<HomeCubit>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<HomeCubit, HomeState>(
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
                  onPressed: () => _cubit.onDecrement(),
                  child: Icon(Icons.exposure_minus_1),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () => _cubit.onIncrement(),
                  child: Icon(Icons.plus_one),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Go to second page',
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BlocProvider.value(
                    value: _cubit,
                    child: HomePageStateless(),
                  );
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
