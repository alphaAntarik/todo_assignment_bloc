class TodoModel {
  int? id;
  String? task;
  String? taskname;
  String? taskDate;
  String? taskPriority;
  int? isDone;

  TodoModel(
      {this.id,
      this.task,
      this.taskname,
      this.taskDate,
      this.taskPriority,
      this.isDone});

  TodoModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["isDone"] is int) {
      isDone = json["isDone"];
    }
    if (json["task"] is String) {
      task = json["task"];
    }
    if (json["taskname"] is String) {
      taskname = json["taskname"];
    }
    if (json["task_date"] is String) {
      taskDate = json["task_date"];
    }
    if (json["task_priority"] is String) {
      taskPriority = json["task_priority"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["isDone"] = isDone;
    _data["task"] = task;
    _data["taskname"] = taskname;
    _data["task_date"] = taskDate;
    _data["task_priority"] = taskPriority;
    return _data;
  }
}
