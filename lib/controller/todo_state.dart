class TodoState {
  final List<Map<String, dynamic>> tasks;

  TodoState({required this.tasks});

  TodoState copyWith({List<Map<String, dynamic>>? tasks}) {
    return TodoState(tasks: tasks ?? this.tasks);
  }
}
