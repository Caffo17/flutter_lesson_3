import 'package:bloc/bloc.dart';

import '../state/home_state.dart';

/// `HomePage` state manager.
/// It manages the logic and the state changes of the screen.
/// It manages the user interaction with the UI.
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(counter: 0));

  /// Callback for the increment button tap.
  void onIncrement() {
    emit(HomeState(
      counter: state.counter + 1,
      wasIncremented: true,
    ));
  }

  /// Callback for the decrement button tap.
  void onDecrement() {
    emit(HomeState(
      counter: state.counter - 1,
      wasIncremented: false,
    ));
  }
}
