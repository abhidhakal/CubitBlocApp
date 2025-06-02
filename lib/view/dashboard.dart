import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/dashboard_cubit.dart';
import 'package:myapp/view/pages/palindrome_view.dart';
import 'package:myapp/view/pages/simple_interest.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, int>(
      builder: (context, selectedIndex) {
        final pages = [
          SimpleInterestScreen(),
          PalindromeScreen(),
        ];

        return Scaffold(
          appBar: AppBar(title: Text('Dashboard')),
          body: pages[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) => context.read<DashboardCubit>().selectScreen(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: 'Simple Interest',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_edu),
                label: 'Palindrome Number',
              ),
            ],
          ),
        );
      },
    );
  }
}
