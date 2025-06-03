import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/model/student_model.dart';
import 'package:myapp/bloc/student_event.dart';
import 'package:myapp/bloc/student_state.dart';
import 'package:myapp/cubit/navigation_cubit.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final NavigationCubit navigationCubit;

  StudentBloc(this.navigationCubit) : super(StudentState.initial()) {
    on<AddStudent>((event, emit) {
      final updatedList = List<StudentModel>.from(state.lstStudents)
        ..add(event.student);
      emit(state.copyWith(lstStudents: updatedList));
    });

    on<DeleteStudent>((event, emit) {
      final updatedList = List<StudentModel>.from(state.lstStudents)
        ..remove(event.student);
      emit(state.copyWith(lstStudents: updatedList));
    });
  }
}
