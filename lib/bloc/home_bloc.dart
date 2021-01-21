import 'dart:async';
import 'package:bloc/bloc.dart';
import 'home_event.dart';
import '../state/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(counter: 0));

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is IncrementEvent) {
      yield HomeState(
        counter: state.counter + 1,
        wasIncremented: true,
      );
    }

    if (event is DecrementEvent) {
      yield HomeState(
        counter: state.counter - 1,
        wasIncremented: false,
      );
    }
  }
}
