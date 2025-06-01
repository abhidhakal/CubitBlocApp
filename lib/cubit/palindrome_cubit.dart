import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/navigation_cubit.dart';

class PalindromeState {
  final String input;
  final bool? isPalindrome;
  final String? error;

  PalindromeState({this.input = '', this.isPalindrome, this.error});

  PalindromeState copyWith({
    String? input,
    bool? isPalindrome,
    String? error,
  }) {
    return PalindromeState(
      input: input ?? this.input,
      isPalindrome: isPalindrome,
      error: error,
    );
  }
}

class PalindromeCubit extends Cubit<PalindromeState> {
  PalindromeCubit(NavigationCubit navigationCubit) : super(PalindromeState());

  void inputChanged(String val) => emit(state.copyWith(input: val, isPalindrome: null, error: null));

  void checkPalindrome() {
    final text = state.input.trim();
    if (text.isEmpty) {
      emit(state.copyWith(error: "Input can't be empty", isPalindrome: null));
      return;
    }
    final normalized = text.toLowerCase().replaceAll(RegExp(r'\s+'), '');
    final reversed = normalized.split('').reversed.join('');
    final result = normalized == reversed;
    emit(state.copyWith(isPalindrome: result, error: null));
  }
}
