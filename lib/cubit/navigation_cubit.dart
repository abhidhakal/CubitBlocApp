import 'package:flutter_bloc/flutter_bloc.dart';

enum AppScreen { splash, dashboard, simpleInterest, palindrome, arithmetic, student }

class NavigationCubit extends Cubit<AppScreen> {
  NavigationCubit() : super(AppScreen.splash);

  void goToSplash() => emit(AppScreen.splash);
  void goToDashboard() => emit(AppScreen.dashboard);
  void goToSimpleInterest() => emit(AppScreen.simpleInterest);
  void goToPalindrome() => emit(AppScreen.palindrome);
  void goToArithmetic() => emit(AppScreen.arithmetic);
  void goToStudent() => emit(AppScreen.student);
}
