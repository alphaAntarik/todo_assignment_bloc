part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class TodoTodayEvent extends TodoEvent {}

class TodoTomorrowEvent extends TodoEvent {}

class TodoUpcomingEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final TodoModel todoModel;

  AddTodoEvent({required this.todoModel});
  @override
  List<Object?> get props => [todoModel];
}

class DeleteTodoEvent extends TodoEvent {
  final TodoModel todoModel;

  DeleteTodoEvent({required this.todoModel});
  @override
  List<Object?> get props => [todoModel];
}

class UpdateTodoEvent extends TodoEvent {
  final TodoModel todoModel;
  UpdateTodoEvent({required this.todoModel});
  @override
  List<Object?> get props => [todoModel];
}
