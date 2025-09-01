import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/controller/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(InitState());
  bool isChecked = false;
  String taskDesc = '';

  //! CheckedBox Changed
  void changeCheckBox(bool? value) {
    isChecked = value!;
    emit(CheckedBoxState());
  }

  List<TodoModel> todoTasks = [];

  void addTask(TodoModel task) {
    todoTasks.add(task);
    emit(SuccessState());
  }

  void removeTask(TodoModel task) {
    todoTasks.removeWhere((e) => e.taskDescription == task.taskDescription);
    emit(SuccessState());
  }
}
