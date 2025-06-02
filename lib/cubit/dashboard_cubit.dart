import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/navigation_cubit.dart';

class DashboardCubit extends Cubit<int> {
  DashboardCubit(NavigationCubit navigationCubit) : super(0); // default to first tab

  void selectScreen(int index) => emit(index);
}
