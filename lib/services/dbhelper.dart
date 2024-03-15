import 'package:todo_assignment/models/todo_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static const int _version = 1;
  static const String _dbName = "Task.db";
  DatabaseHelper._init();
  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE Task(id INTEGER PRIMARY KEY, task TEXT NOT NULL, taskname TEXT NOT NULL, task_date TEXT NOT NULL, task_priority TEXT NOT NULL,isDone INTEGER NOT NULL);"),
        version: _version);
  }

  static Future<int> addTask(TodoModel todoModel) async {
    final db = await _getDB();

    return await db.insert("Task", todoModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updatetask(TodoModel todoModel) async {
    final db = await _getDB();
    return await db.update("Task", todoModel.toJson(),
        where: 'id = ?',
        whereArgs: [todoModel.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteTask(TodoModel todoModel) async {
    final db = await _getDB();
    return await db.delete(
      "Task",
      where: 'id = ?',
      whereArgs: [todoModel.id],
    );
  }

  static Future<List<TodoModel>?> getAllTasks() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Task");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(
        maps.length, (index) => TodoModel.fromJson(maps[index]));
  }
}
