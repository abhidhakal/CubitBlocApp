import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/dashboard_cubit.dart';
import 'package:myapp/view/pages/arithmetic_bloc_view.dart';
import 'package:myapp/view/pages/palindrome_view.dart';
import 'package:myapp/view/pages/simple_interest.dart';
import 'package:myapp/view/pages/student_bloc_view.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, int>(
      builder: (context, selectedIndex) {
        final pages = [
          ArithmeticBlocView(),
          SimpleInterestScreen(),
          PalindromeScreen(),
          StudentBlocView(),
        ];

        return Scaffold(
          body: pages[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) => context.read<DashboardCubit>().selectScreen(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Arithmetic',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: 'Simple Interest',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_edu),
                label: 'Palindrome Number',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.man),
                label: 'Student',
                backgroundColor: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }
}
