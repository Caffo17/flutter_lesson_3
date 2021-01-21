import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeEvent {}

class IncrementEvent extends HomeEvent {}

class DecrementEvent extends HomeEvent {}
