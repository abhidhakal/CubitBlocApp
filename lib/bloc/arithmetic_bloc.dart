import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/arithmetic_event.dart';
import 'package:myapp/cubit/navigation_cubit.dart';

class ArithmeticBloc extends Bloc<ArithmeticEvent, int> {
  ArithmeticBloc(NavigationCubit navigationCubit) : super(0) {

    on<IncrementEvent>((event, emit) {
      final result = event.first + event.second;
      emit(result);
    });

    on<DecrementEvent>((event, emit) {
      final result = event.first - event.second;
      emit(result);
    });

    on<MultiplyEvent>((event, emit) {
      final result = event.first * event.second;
      emit(result);
    });

    }
}