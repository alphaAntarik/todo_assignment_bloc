import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_assignment/bloc/todo_bloc.dart';
import 'package:todo_assignment/models/todo_model.dart';

class TaskContainer extends StatefulWidget {
  Function onchanged;
  Function onDelete;
  final TodoModel todoModel;

  TaskContainer(
      {required this.todoModel,
      required this.onchanged,
      required this.onDelete});

  @override
  State<TaskContainer> createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 78, 32, 18),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.todoModel.taskname!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          //  SizedBox(height: 5.0),
          Text(
            widget.todoModel.task!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Creation Date',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    widget.todoModel.taskDate!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Checkbox(
                    value: widget.todoModel.isDone == 0 ? false : true,
                    onChanged: (newValue) {
                      setState(() {
                        context.read<TodoBloc>().add(
                              UpdateTodoEvent(
                                  todoModel: TodoModel(
                                      id: widget.todoModel.id,
                                      task: widget.todoModel.task,
                                      taskDate: widget.todoModel.taskDate,
                                      taskPriority:
                                          widget.todoModel.taskPriority,
                                      taskname: widget.todoModel.taskname,
                                      isDone: newValue! ? 1 : 0)),
                            );
                        widget.onchanged(newValue);
                      });
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Priority',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    widget.todoModel.taskPriority!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.onDelete();
                        });
                      },
                      icon: Icon(Icons.delete))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
