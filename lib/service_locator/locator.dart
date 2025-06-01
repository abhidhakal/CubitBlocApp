import 'package:get_it/get_it.dart';
import 'package:myapp/cubit/dashboard_cubit.dart';
import 'package:myapp/cubit/navigation_cubit.dart';
import 'package:myapp/cubit/splashscreen_cubit.dart';
import 'package:myapp/cubit/simple_interest_cubit.dart';
import 'package:myapp/cubit/palindrome_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Singleton for navigation because it's global app state
  getIt.registerLazySingleton<NavigationCubit>(() => NavigationCubit());

  // Factories for feature cubits, injecting navigation cubit if needed
  getIt.registerFactory(() => SplashCubit(getIt<NavigationCubit>()));
  getIt.registerFactory(() => DashboardCubit(getIt<NavigationCubit>()));
  getIt.registerFactory(() => SimpleInterestCubit(getIt<NavigationCubit>()));
  getIt.registerFactory(() => PalindromeCubit(getIt<NavigationCubit>()));
}
