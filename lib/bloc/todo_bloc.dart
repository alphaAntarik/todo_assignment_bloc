import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:todo_assignment/models/todo_model.dart';
import 'package:todo_assignment/services/dbhelper.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, AddAndGetTasksState> {
  TodoBloc() : super(const AddAndGetTasksState()) {
    on<TodoTodayEvent>((event, emit) async {
      emit(AddAndGetTasksLoading(loading: 'loading'));
      try {
        final List<TodoModel>? result = await DatabaseHelper.getAllTasks();
        List<TodoModel> todos = [];
        String today = DateFormat('dd-MM-yy').format(DateTime.now());
        for (TodoModel todomodel in result!) {
          if (todomodel.taskDate == today) {
            todos.add(todomodel);
          }
        }
        emit(AddAndGetTasksLoadedTodayState(tasks: todos));
      } catch (e) {
        emit(AddAndGetTasksErrorState(error: e.toString()));
      }
    });
    on<TodoTomorrowEvent>((event, emit) async {
      emit(AddAndGetTasksLoading(loading: 'loading'));
      try {
        final List<TodoModel>? result = await DatabaseHelper.getAllTasks();
        List<TodoModel> todos = [];
        String tomorrow = DateFormat('dd-MM-yy')
            .format(DateTime.now().add(Duration(days: 1)));
        for (TodoModel todomodel in result!) {
          if (todomodel.taskDate == tomorrow) {
            todos.add(todomodel);
          }
        }
        emit(AddAndGetTasksLoadedTomorrowState(tasks: todos));
      } catch (e) {
        emit(AddAndGetTasksErrorState(error: e.toString()));
      }
    });
    on<TodoUpcomingEvent>((event, emit) async {
      emit(AddAndGetTasksLoading(loading: 'loading'));
      try {
        final List<TodoModel>? result = await DatabaseHelper.getAllTasks();
        List<TodoModel> todos = [];
        String today = DateFormat('dd-MM-yy').format(DateTime.now());
        String tomorrow = DateFormat('dd-MM-yy')
            .format(DateTime.now().add(Duration(days: 1)));
        for (TodoModel todomodel in result!) {
          if (todomodel.taskDate != today && todomodel.taskDate != tomorrow) {
            todos.add(todomodel);
          }
        }
        emit(AddAndGetTasksLoadedUpcomingState(tasks: todos));
      } catch (e) {
        emit(AddAndGetTasksErrorState(error: e.toString()));
      }
    });
    on<AddTodoEvent>((event, emit) async {
      emit(AddAndGetTasksLoading(loading: 'loading'));
      try {
        final int result = await DatabaseHelper.addTask(event.todoModel);
        emit(AddAndGetTasksAddState(result: result));
      } catch (e) {
        emit(AddAndGetTasksErrorState(error: e.toString()));
      }
    });
    on<DeleteTodoEvent>((event, emit) async {
      emit(AddAndGetTasksLoading(loading: 'loading'));
      try {
        final int result = await DatabaseHelper.deleteTask(event.todoModel);
        emit(AddAndGetTasksDeleteState(result: result));
      } catch (e) {
        emit(AddAndGetTasksErrorState(error: e.toString()));
      }
    });
    on<UpdateTodoEvent>((event, emit) async {
      emit(AddAndGetTasksLoading(loading: 'loading'));
      try {
        final int result = await DatabaseHelper.updatetask(event.todoModel);
        emit(AddAndGetTasksUpdateState(result: result));
      } catch (e) {
        emit(AddAndGetTasksErrorState(error: e.toString()));
      }
    });
  }
}
