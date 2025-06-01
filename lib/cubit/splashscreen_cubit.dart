import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_cubit.dart';

class SplashCubit extends Cubit<void> {
  final NavigationCubit navigationCubit;

  SplashCubit(this.navigationCubit) : super(null);

  void initialize() async {
    await Future.delayed(Duration(seconds: 2));
    // after splash, navigate to dashboard
    navigationCubit.goToDashboard();
  }
}
