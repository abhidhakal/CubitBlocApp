import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/student_bloc.dart';
import 'package:myapp/bloc/student_event.dart';
import 'package:myapp/bloc/student_state.dart';
import 'package:myapp/model/student_model.dart';

class StudentBlocView extends StatelessWidget {
  StudentBlocView({super.key});
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Bloc"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField(nameController, "Name"),
              SizedBox(height: 10),
              buildTextField(ageController, "Age", isNumber: true),
              SizedBox(height: 10),
              buildTextField(addressController, "Address"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final student = StudentModel(
                      name: nameController.text,
                      age: int.parse(ageController.text),
                      address: addressController.text,
                    );
                    context.read<StudentBloc>().add(AddStudent(student));
                    nameController.clear();
                    ageController.clear();
                    addressController.clear();
                  }
                },
                child: Text("Submit"),
              ),
              SizedBox(height: 20),
              BlocBuilder<StudentBloc, StudentState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const CircularProgressIndicator();
                  } else if (state.lstStudents.isEmpty) {
                    return const Text("No students");
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.lstStudents.length,
                        itemBuilder: (context, index) {
                          final student = state.lstStudents[index];
                          return Card(
                            child: ListTile(
                              title: Text(student.name),
                              subtitle: Text("${student.age}"),
                              trailing: IconButton(
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Delete?"),
                                    content: Text(
                                        "Are you sure you want to delete ${student.name}?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("No"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context
                                              .read<StudentBloc>()
                                              .add(DeleteStudent(student));
                                          Navigator.pop(context);
                                        },
                                        child: Text("Yes"),
                                      ),
                                    ],
                                  ),
                                ),
                                icon: Icon(Icons.delete),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label,
      {bool isNumber = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $label";
        }
        return null;
      },
    );
  }
}
