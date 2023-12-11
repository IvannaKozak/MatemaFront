import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matemafront/api/auth_service.dart';
import 'package:matemafront/api/secure_storage_service.dart';
import 'dart:convert';

import 'package:matemafront/models/task_model.dart';
import 'package:matemafront/models/theme_model.dart';

class ApiService {
  final String baseUrl = 'https://matema-dev-ncrzmugb6q-lm.a.run.app';

  Future<List<Task>> getTasks(BuildContext context) async {
    await AuthService().verifyAndRefreshToken(context);

    // Retrieve the access token from secure storage
    var accessToken = await SecureStorageService().getToken('accessToken');

    if (accessToken == null) {
      throw Exception('Access Token is null, user needs to log in again.');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/manager/task/all/'),
      // Include the Authorization header with the Bearer token
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

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
