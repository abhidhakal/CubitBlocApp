import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/navigation_cubit.dart';

// State class for Simple Interest
class SimpleInterestState {
  final String principal;
  final String rate;
  final String time;
  final double? result;
  final String? error;

  SimpleInterestState({
    this.principal = '',
    this.rate = '',
    this.time = '',
    this.result,
    this.error,
  });

  SimpleInterestState copyWith({
    String? principal,
    String? rate,
    String? time,
    double? result,
    String? error,
  }) {
    return SimpleInterestState(
      principal: principal ?? this.principal,
      rate: rate ?? this.rate,
      time: time ?? this.time,
      result: result,
      error: error,
    );
  }
}

class SimpleInterestCubit extends Cubit<SimpleInterestState> {
  SimpleInterestCubit(NavigationCubit navigationCubit) : super(SimpleInterestState());

  void principalChanged(String value) => emit(state.copyWith(principal: value, error: null, result: null));
  void rateChanged(String value) => emit(state.copyWith(rate: value, error: null, result: null));
  void timeChanged(String value) => emit(state.copyWith(time: value, error: null, result: null));

  void calculate() {
    final p = double.tryParse(state.principal);
    final r = double.tryParse(state.rate);
    final t = double.tryParse(state.time);

    if (p == null || r == null || t == null) {
      emit(state.copyWith(error: "Please enter valid numbers", result: null));
      return;
    }

    final interest = (p * r * t) / 100;
    emit(state.copyWith(result: interest, error: null));
  }
}
