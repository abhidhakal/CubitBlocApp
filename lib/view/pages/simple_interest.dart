import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/simple_interest_cubit.dart';

class SimpleInterestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimpleInterestCubit, SimpleInterestState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Principal'),
                keyboardType: TextInputType.number,
                onChanged: (val) => context.read<SimpleInterestCubit>().principalChanged(val),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Rate of Interest'),
                keyboardType: TextInputType.number,
                onChanged: (val) => context.read<SimpleInterestCubit>().rateChanged(val),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Time (years)'),
                keyboardType: TextInputType.number,
                onChanged: (val) => context.read<SimpleInterestCubit>().timeChanged(val),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.read<SimpleInterestCubit>().calculate(),
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 20),
              if (state.error != null)
                Text(state.error!, style: TextStyle(color: Colors.red)),
              if (state.result != null)
                Text('Simple Interest: ${state.result!.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24)),
            ],
          ),
        );
      },
    );
  }
}
