class TaskContainer {
  factory TaskContainer.fromJson(Map<String, dynamic> json) {
    return TaskContainer(
      task: Task.fromJson(json['task'] as Map<String, dynamic>),
      isWeekly: json['is_weekly'] as bool,
    );
  }
  TaskContainer({required this.task, required this.isWeekly});

  final Task task;
  final bool isWeekly;
}

class Task {
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as int,
      name: json['name'] as String,
      theme: json['theme'] as String,
      point: json['point'] as int,
    );
  }
  Task({
    required this.id,
    required this.name,
    required this.theme,
    required this.point,
  });

  final int id;
  final String name;
  final String theme;
  final int point;
}
