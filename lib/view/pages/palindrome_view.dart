import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/palindrome_cubit.dart';

class PalindromeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PalindromeCubit, PalindromeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Palindrome"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Enter text to check'),
                  onChanged: (val) => context.read<PalindromeCubit>().inputChanged(val),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => context.read<PalindromeCubit>().checkPalindrome(),
                  child: const Text('Check'),
                ),
                const SizedBox(height: 20),
                if (state.error != null)
                  Text(state.error!, style: const TextStyle(color: Colors.red)),
                if (state.isPalindrome != null)
                  Text(
                    state.isPalindrome! ? 'It is a palindrome!' : 'Not a palindrome',
                    style: const TextStyle(fontSize: 24),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
