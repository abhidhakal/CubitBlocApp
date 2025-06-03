import 'package:flutter/foundation.dart';
import 'package:myapp/model/student_model.dart';

@immutable
abstract class StudentEvent {}

class AddStudent extends StudentEvent {
  final StudentModel student;
  AddStudent(this.student);
}

class DeleteStudent extends StudentEvent {
  final StudentModel student;
  DeleteStudent(this.student);
}
