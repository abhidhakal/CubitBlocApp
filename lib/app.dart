import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/dashboard_cubit.dart';
import 'package:myapp/cubit/navigation_cubit.dart';
import 'package:myapp/cubit/palindrome_cubit.dart';
import 'package:myapp/cubit/simple_interest_cubit.dart';
import 'package:myapp/cubit/splashscreen_cubit.dart';
import 'package:myapp/service_locator/locator.dart';
import 'package:myapp/view/dashboard.dart';
import 'package:myapp/view/pages/palindrome_view.dart';
import 'package:myapp/view/pages/simple_interest.dart';
import 'package:myapp/view/splashscreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationCubit = getIt<NavigationCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: navigationCubit),
        BlocProvider(create: (_) => getIt<SplashCubit>()),
        BlocProvider(create: (_) => getIt<DashboardCubit>()),
        BlocProvider(create: (_) => getIt<SimpleInterestCubit>()),
        BlocProvider(create: (_) => getIt<PalindromeCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<NavigationCubit, AppScreen>(
          builder: (context, screen) {
            switch (screen) {
              case AppScreen.splash:
                return BlocProvider(
                  create: (_) => getIt<SplashCubit>(),
                  child: Splashscreen(),
                );
              case AppScreen.dashboard:
                return BlocProvider(
                  create: (_) => getIt<DashboardCubit>(),
                  child: DashboardScreen(),
                );
              case AppScreen.simpleInterest:
                return BlocProvider(
                  create: (_) => getIt<SimpleInterestCubit>(),
                  child: SimpleInterestScreen(),
                );
              case AppScreen.palindrome:
                return BlocProvider(
                  create: (_) => getIt<PalindromeCubit>(),
                  child: PalindromeScreen(),
                );
              default:
                return BlocProvider(
                  create: (_) => getIt<SplashCubit>(),
                  child: Splashscreen(),
                );
            }
          },
        ),
      ),
    );
  }
}
