import 'package:flutter/foundation.dart';

@immutable
class ArithmeticEvent {}

class IncrementEvent extends ArithmeticEvent {
  final int first;
  final int second;

  IncrementEvent(this.first, this.second);
}

class DecrementEvent extends ArithmeticEvent {
  final int first;
  final int second;

  DecrementEvent(this.first, this.second);
}

class MultiplyEvent extends ArithmeticEvent {
  final int first;
  final int second;

  MultiplyEvent(this.first, this.second);
}