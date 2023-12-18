class Topic {
  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      name: json['name'],
    );
  }

  Topic({required this.name});
  final String name;
}
