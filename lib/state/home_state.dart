import 'package:flutter/cupertino.dart';

@immutable
/// State of the home page of this tutorial.
class HomeState {
  /// Indicates the counter state.
  final int counter;
  /// True => last event was an increment.
  /// False => last event was a decrement.
  final bool wasIncremented;

  /// Constructor of the state.
  /// The initial state of the counter is required every time a new instance is created.
  /// The `wasIncremented` parameter is a optional value. His default value is false.
  const HomeState({
    @required this.counter,
    this.wasIncremented = false,
  });
}
