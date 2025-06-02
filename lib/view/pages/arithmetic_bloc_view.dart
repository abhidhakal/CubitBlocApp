import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/arithmetic_bloc.dart';
import 'package:myapp/bloc/arithmetic_event.dart';

class ArithmeticBlocView extends StatelessWidget {
  const ArithmeticBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    final firstController = TextEditingController();
    final secondController = TextEditingController();
    final _myFormKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text("Arithmetic Cubit")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _myFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: firstController,
                decoration: InputDecoration(
                  labelText: "First Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter the number" : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: secondController,
                decoration: InputDecoration(
                  labelText: "Second Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter the number" : null,
              ),
              SizedBox(height: 20),
              BlocBuilder<ArithmeticBloc, int>(
                builder: (context, state) {
                  return Text('Result: $state', style: TextStyle(fontSize: 20));
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_myFormKey.currentState!.validate()) {
                    final firstNumber = int.parse(firstController.text);
                    final secondNumber = int.parse(secondController.text);
                    context.read<ArithmeticBloc>().add(IncrementEvent(firstNumber, secondNumber));
                  }
                },
                child: Text("Add"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_myFormKey.currentState!.validate()) {
                    final firstNumber = int.parse(firstController.text);
                    final secondNumber = int.parse(secondController.text);
                    context.read<ArithmeticBloc>().add(DecrementEvent(firstNumber, secondNumber));
                  }
                },
                child: Text("Subtract"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_myFormKey.currentState!.validate()) {
                    final firstNumber = int.parse(firstController.text);
                    final secondNumber = int.parse(secondController.text);
                    context.read<ArithmeticBloc>().add(MultiplyEvent(firstNumber, secondNumber));
                  }
                },
                child: Text("Multiply"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
