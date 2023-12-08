class Task {
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      theme: json['theme'],
      point: json['point'],
    );
  }

  Task(
      {required this.id,
      required this.name,
      required this.theme,
      required this.point});
  final int id;
  final String name;
  final String theme;
  final int point;
}
