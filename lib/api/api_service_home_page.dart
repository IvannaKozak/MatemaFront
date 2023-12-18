import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matemafront/api/auth_service.dart';
import 'package:matemafront/api/secure_storage_service.dart';
import 'package:matemafront/models/generated_task_model.dart';
import 'dart:convert';

import 'package:matemafront/models/theme_model.dart';
import 'package:matemafront/models/user_model.dart';

class ApiService {
  final String baseUrl = 'https://matema-dev-ncrzmugb6q-lm.a.run.app';

  Future<List<Task>> getAllTasks(BuildContext context) async {
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

  Future<List<TaskContainer>> getTasks(
      BuildContext context, String username) async {
    await AuthService().verifyAndRefreshToken(context);

    // Retrieve the access token from secure storage
    var accessToken = await SecureStorageService().getToken('accessToken');

    if (accessToken == null) {
      throw Exception('Access Token is null, user needs to log in again.');
    }

    final url = Uri.parse('$baseUrl/task/list/get/$username');

    final response = await http.get(
      url,
      // Include the Authorization header with the Bearer token
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      String utf8Body = utf8.decode(response.bodyBytes);
      List<dynamic> taskContainersJson = json.decode(utf8Body);
      List<TaskContainer> taskContainers = taskContainersJson
          .map((taskContainerJson) => TaskContainer.fromJson(taskContainerJson))
          .toList();
      return taskContainers;
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      print(response.statusCode);
    }
    // else {
    //   print(response.statusCode);
    //   throw Exception('Failed to load tasks');
    // }
    return [];
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

  Future<User> getUser(BuildContext context) async {
    await AuthService().verifyAndRefreshToken(context);

    // Retrieve the access token from secure storage
    var accessToken = await SecureStorageService().getToken('accessToken');

    if (accessToken == null) {
      throw Exception('Access Token is null, user needs to log in again.');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/auth/users/me/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      String utf8Body = utf8.decode(response.bodyBytes);
      Map<String, dynamic> userJson =
          json.decode(utf8Body) as Map<String, dynamic>;
      return User.fromJson(userJson);
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      print(response.statusCode);
      return User(
        email: 'email',
        firstName: 'firstName',
        lastName: 'lastName',
        password: 'password',
        id: 1,
        username: 'username',
      );
    } else {
      return User(
        email: 'email',
        firstName: 'firstName',
        lastName: 'lastName',
        password: 'password',
        id: 1,
        username: 'username',
      );
    }
  }
}
