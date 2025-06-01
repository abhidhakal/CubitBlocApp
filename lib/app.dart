import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/dashboard_cubit.dart';
import 'package:myapp/cubit/navigation_cubit.dart';
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
        // add other cubits here as needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<NavigationCubit, AppScreen>(
          builder: (context, screen) {
            switch (screen) {
              case AppScreen.splash:
                return Splashscreen();
              case AppScreen.dashboard:
                return DashboardScreen();
              case AppScreen.simpleInterest:
                return SimpleInterestScreen();
              case AppScreen.palindrome:
                return PalindromeScreen();
              default:
                return Splashscreen();
            }
          },
        ),
      ),
    );
  }
}
