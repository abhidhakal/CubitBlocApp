import 'package:myapp/model/student_model.dart';

class StudentState {
  final List<StudentModel> lstStudents;
  final bool isLoading;

  StudentState({required this.lstStudents, this.isLoading = false});

  factory StudentState.initial() {
    return StudentState(lstStudents: [], isLoading: false);
  }

  StudentState copyWith({List<StudentModel>? lstStudents, bool? isLoading}) {
    return StudentState(
      lstStudents: lstStudents ?? this.lstStudents,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
