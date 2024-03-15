import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_assignment/bloc/todo_bloc.dart';
import 'package:todo_assignment/models/todo_model.dart';
import 'package:todo_assignment/presentation/list_of_tasks/widgets/each_list_item.dart';

class ListOfTasks extends StatefulWidget {
  final List<TodoModel> todos;

  const ListOfTasks({
    super.key,
    required this.todos,
  });

  @override
  State<ListOfTasks> createState() => _ListOfTasksState();
}

class _ListOfTasksState extends State<ListOfTasks> {
  TextEditingController controller = TextEditingController();
  String search = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('List of tasks'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(labelText: 'Enter anyhing'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      search = controller.text;
                    });
                  },
                  child: Text('search')),
              Container(
                height: MediaQuery.of(context).size.height - 100,
                child: ListView.builder(
                    itemCount: widget.todos.length,
                    itemBuilder: (context, int index) {
                      TodoModel todo = widget.todos[index];
                      if (search == '') {
                        return TaskContainer(
                          todoModel: widget.todos[index],
                          onchanged: (val) {
                            setState(() {
                              widget.todos[index].isDone = val ? 1 : 0;
                            });
                          },
                          onDelete: () {
                            setState(() {
                              widget.todos.remove(todo);
                              context.read<TodoBloc>().add(
                                    DeleteTodoEvent(todoModel: todo),
                                  );
                            });
                          },
                        );
                      } else {
                        if (widget.todos[index].task!
                                .contains(search.toLowerCase()) ||
                            widget.todos[index].taskname!
                                .contains(search.toLowerCase()) ||
                            widget.todos[index].taskDate!
                                .contains(search.toLowerCase()) ||
                            widget.todos[index].taskPriority!
                                .contains(search.toLowerCase())) {
                          return TaskContainer(
                            todoModel: widget.todos[index],
                            onchanged: (val) {
                              setState(() {
                                widget.todos[index].isDone = val ? 1 : 0;
                              });
                            },
                            onDelete: () {
                              setState(() {
                                widget.todos.remove(todo);
                                context.read<TodoBloc>().add(
                                      DeleteTodoEvent(todoModel: todo),
                                    );
                              });
                            },
                          );
                        }
                        return Container();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
