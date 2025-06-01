import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_cubit.dart';

class DashboardCubit extends Cubit<int> {
  final NavigationCubit navigationCubit;

  DashboardCubit(this.navigationCubit) : super(0);

  void selectScreen(int index) {
    switch (index) {
      case 0:
        navigationCubit.goToSimpleInterest();
        break;
      case 1:
        navigationCubit.goToPalindrome();
        break;
      default:
        navigationCubit.goToDashboard();
        break;
    }
  }
}
