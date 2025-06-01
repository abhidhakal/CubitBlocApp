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
        Widget body;
        switch (selectedIndex) {
          case 0:
            body = SimpleInterestScreen();
            break;
          case 1:
            body = PalindromeScreen();
            break;
          default:
            body = Center(child: Text('Welcome to Dashboard Home!', style: TextStyle(fontSize: 24)));
        }

        return Scaffold(
          appBar: AppBar(title: Text('Dashboard')),
          body: body,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) => context.read<DashboardCubit>().selectScreen(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: 'Simple Interest',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
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
