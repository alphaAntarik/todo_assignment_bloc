import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_assignment/bloc/todo_bloc.dart';

import 'package:todo_assignment/presentation/add_task_screens/add_task_screen.dart';
import 'package:todo_assignment/presentation/list_of_tasks/list_of_task_screen.dart';

class HomeScreen extends StatefulWidget {
  static String homescreenroute = '/homescreenroute';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todo app'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, AddTaskScreen.addtaskscreenroute);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocListener<TodoBloc, AddAndGetTasksState>(
                listener: (context, state) {
                  if (state is AddAndGetTasksLoadedTodayState) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListOfTasks(
                            todos: state.tasks,
                          ),
                        ));
                  }
                },
                child: ElevatedButton(
                    onPressed: () {
                      context.read<TodoBloc>().add(
                            TodoTodayEvent(),
                          );
                    },
                    child: Text('Today')),
              ),
              SizedBox(height: 10),
              BlocListener<TodoBloc, AddAndGetTasksState>(
                listener: (context, state) {
                  if (state is AddAndGetTasksLoadedTomorrowState) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListOfTasks(
                            todos: state.tasks,
                          ),
                        ));
                  }
                },
                child: ElevatedButton(
                    onPressed: () {
                      context.read<TodoBloc>().add(
                            TodoTomorrowEvent(),
                          );
                    },
                    child: Text('Tomorrow')),
              ),
              SizedBox(height: 10),
              BlocListener<TodoBloc, AddAndGetTasksState>(
                listener: (context, state) {
                  if (state is AddAndGetTasksLoadedUpcomingState) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListOfTasks(
                            todos: state.tasks,
                          ),
                        ));
                  }
                },
                child: ElevatedButton(
                    onPressed: () {
                      context.read<TodoBloc>().add(
                            TodoUpcomingEvent(),
                          );
                    },
                    child: Text('Upcoming')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
