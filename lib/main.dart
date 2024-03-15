import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_assignment/bloc/todo_bloc.dart';

import 'package:todo_assignment/presentation/add_task_screens/add_task_screen.dart';
import 'package:todo_assignment/presentation/home_screens/home_screen.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: MaterialApp(
        title: 'Todo assignment',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: HomeScreen.homescreenroute,
        routes: {
          HomeScreen.homescreenroute: (context) => HomeScreen(),
          AddTaskScreen.addtaskscreenroute: (context) => AddTaskScreen(),
        },
      ),
    );
  }
}
