class TodoState {}

class InitState extends TodoState {}

class LoadingState extends TodoState {}

class SuccessState extends TodoState {}

class FailedState extends TodoState {
  final String error;

  FailedState({required this.error});
}

class CheckedBoxState extends TodoState {}
