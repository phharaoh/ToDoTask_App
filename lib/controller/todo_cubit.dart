import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/controller/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState(tasks: []));
  final TextEditingController controller = TextEditingController();

  //! CheckedBox Changed
  void toggleTask(int index, bool value) {
    final newTasks = List<Map<String, dynamic>>.from(state.tasks);
    newTasks[index]["isDone"] = value;
    emit(state.copyWith(tasks: newTasks));
  }

  //! Add Task
  void addTask(String title) {
    if (title.trim().isEmpty) return;
    final newTasks = List<Map<String, dynamic>>.from(state.tasks)
      ..add({"title": title.trim(), "isDone": false});
    emit(state.copyWith(tasks: newTasks));
  }

  //! Delete Task
  void deleteTask(int index) {
    final newTasks = List<Map<String, dynamic>>.from(state.tasks)
      ..removeAt(index);
    emit(state.copyWith(tasks: newTasks));
  }
}
