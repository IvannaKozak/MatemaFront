import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:matemafront/models/task_model.dart';
import 'package:matemafront/models/theme_model.dart';

class ApiService {
  final String baseUrl = 'https://matema-dev-ncrzmugb6q-lm.a.run.app';

  Future<List<Task>> getTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/manager/task/all/'));

    if (response.statusCode == 200) {
      String utf8Body = utf8.decode(response.bodyBytes);
      List<dynamic> tasksJson = json.decode(utf8Body);
      List<Task> tasks =
          tasksJson.map((taskJson) => Task.fromJson(taskJson)).toList();
      return tasks;
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<List<Topic>> getTopics() async {
    final response = await http.get(Uri.parse('$baseUrl/manager/theme/all/'));

    if (response.statusCode == 200) {
      String utf8Body = utf8.decode(response.bodyBytes);
      List<dynamic> themesJson = json.decode(utf8Body);
      List<Topic> themes =
          themesJson.map((themeJson) => Topic.fromJson(themeJson)).toList();
      return themes;
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
