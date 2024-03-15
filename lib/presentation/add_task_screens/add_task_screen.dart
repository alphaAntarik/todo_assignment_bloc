import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_assignment/bloc/todo_bloc.dart';
import 'package:todo_assignment/models/todo_model.dart';

import 'package:todo_assignment/presentation/home_screens/home_screen.dart';
import 'package:todo_assignment/utils/validators/validator.dart';

class AddTaskScreen extends StatefulWidget {
  static String addtaskscreenroute = '/addtaskscreenroute';
  AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController title = TextEditingController();

  TextEditingController desc = TextEditingController();

  TextEditingController date = TextEditingController();

  String priority = '';
  bool clicked = false;

  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Notes'),
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, HomeScreen.homescreenroute);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                  key: key,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: title,
                        decoration: InputDecoration(labelText: 'Task Name'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          }
                          return 'Please enter Task name';
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: desc,
                        decoration: InputDecoration(labelText: 'Task'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          }
                          return 'Please enter Task';
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: date,
                        decoration: InputDecoration(labelText: 'Finish date'),
                        textInputAction: TextInputAction.done,
                        validator: validateDate,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          priority = 'High';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: priority == 'High'
                              ? Colors.blue.withOpacity(0.5)
                              : Colors.purpleAccent),
                      child: Text('High'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          priority = 'Medium';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: priority == 'Medium'
                              ? Colors.blue.withOpacity(0.5)
                              : Colors.purpleAccent),
                      child: Text('Medium'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: priority == 'Low'
                              ? Colors.blue.withOpacity(0.5)
                              : Colors.purpleAccent),
                      onPressed: () {
                        setState(() {
                          priority = 'Low';
                        });
                      },
                      child: Text('Low'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if (clicked && priority == '')
                  Text(
                    'Please select priority',
                    style: TextStyle(color: Colors.red),
                  ),
                //   Spacer(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (key.currentState!.validate() && priority != '') {
                        Random random = Random();
                        TodoModel todoModel = TodoModel();
                        todoModel.id = random.nextInt(90000) + 10000;
                        todoModel.task = desc.text;
                        todoModel.taskname = title.text;
                        todoModel.taskDate = date.text;
                        todoModel.taskPriority = priority;
                        todoModel.isDone = 0;
                        context.read<TodoBloc>().add(
                              AddTodoEvent(todoModel: todoModel),
                            );
                        Navigator.pushReplacementNamed(
                            context, HomeScreen.homescreenroute);
                      }
                    });
                  },
                  child: Text('Save Task'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
