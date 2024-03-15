part of 'todo_bloc.dart';

class AddAndGetTasksState extends Equatable {
  const AddAndGetTasksState();

  @override
  List<Object> get props => [];
}

final class AddAndGetTasksLoading extends AddAndGetTasksState {
  final String loading;

  AddAndGetTasksLoading({required this.loading});
  @override
  List<Object> get props => [loading];
}

final class AddAndGetTasksErrorState extends AddAndGetTasksState {
  final String error;

  AddAndGetTasksErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

final class AddAndGetTasksAddState extends AddAndGetTasksState {
  final int result;

  AddAndGetTasksAddState({required this.result});
  @override
  List<Object> get props => [result];
}

final class AddAndGetTasksUpdateState extends AddAndGetTasksState {
  final int result;

  AddAndGetTasksUpdateState({required this.result});
  @override
  List<Object> get props => [result];
}

final class AddAndGetTasksDeleteState extends AddAndGetTasksState {
  final int result;

  AddAndGetTasksDeleteState({required this.result});
  @override
  List<Object> get props => [result];
}

final class AddAndGetTasksLoadedTodayState extends AddAndGetTasksState {
  final List<TodoModel> tasks;

  AddAndGetTasksLoadedTodayState({required this.tasks});
  @override
  List<Object> get props => [tasks];
}

final class AddAndGetTasksLoadedTomorrowState extends AddAndGetTasksState {
  final List<TodoModel> tasks;

  AddAndGetTasksLoadedTomorrowState({required this.tasks});
  @override
  List<Object> get props => [tasks];
}

final class AddAndGetTasksLoadedUpcomingState extends AddAndGetTasksState {
  final List<TodoModel> tasks;

  AddAndGetTasksLoadedUpcomingState({required this.tasks});
  @override
  List<Object> get props => [tasks];
}

final class IsAddOrUpdateState extends AddAndGetTasksState {
  final bool isadd;

  IsAddOrUpdateState({required this.isadd});
  @override
  List<Object> get props => [isadd];
}

// enum TodoStatus { initial, loading, success, error, today, tomorrow, upcoming }

// class TodoState extends Equatable {
//   final List<TodoModel> todos;
//   final TodoStatus status;
//   const TodoState(
//       {this.todos = const <TodoModel>[], this.status = TodoStatus.initial});

//   TodoState copywWith({List<TodoModel>? todos, TodoStatus? status}) {
//     return TodoState(todos: todos ?? this.todos, status: status ?? this.status);
//   }

//   @override
//   factory TodoState.fromJson(Map<String, dynamic> json) {
//     try {
//       var listOfTodos = (json['todo'] as List<dynamic>)
//           .map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
//           .toList();

//       return TodoState(
//           todos: listOfTodos,
//           status: TodoStatus.values.firstWhere(
//               (element) => element.name.toString() == json['status']));
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Map<String, dynamic> toJson() {
//     return {'todo': todos, 'status': status.name};
//   }

//   @override
//   List<Object?> get props => [todos, status];
// }
