import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              BlocBuilder<ArithmeticCubit, int>(
                builder: (context, state) {
                  return Text('Result: $state', style: TextStyle(fontSize: 20));
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_myFormKey.currentState!.validate()) {
                    context.read<ArithmeticCubit>().add(
                          int.parse(firstController.text),
                          int.parse(secondController.text),
                        );
                  }
                },
                child: Text("Add"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_myFormKey.currentState!.validate()) {
                    context.read<ArithmeticCubit>().subtract(
                          int.parse(firstController.text),
                          int.parse(secondController.text),
                        );
                  }
                },
                child: Text("Subtract"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_myFormKey.currentState!.validate()) {
                    context.read<ArithmeticCubit>().multiply(
                          int.parse(firstController.text),
                          int.parse(secondController.text),
                        );
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
