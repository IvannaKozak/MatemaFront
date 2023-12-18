import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:matemafront/api/api_service_fetch_user_data.dart';

class TaskStatService {
  final String baseUrl = 'https://matema-dev-ncrzmugb6q-lm.a.run.app';

  Future<List<dynamic>> fetchCompletedTasks(BuildContext context) async {
    try {
      String username = await fetchUsername(context);
      var url = Uri.parse("$baseUrl/task/statistic/test_ivanka/");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(utf8.decode(response.bodyBytes)); 
        return data;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching completed tasks: $error');
    }
  }

  Future<List<dynamic>> getCompletedTasks(BuildContext context) async {
    List<dynamic> completedTasks = await fetchCompletedTasks(context);
    return completedTasks.where((task) => task['is_done'] == true).toList();
  }

  Future<List<dynamic>> getFailedTasks(BuildContext context) async {
    List<dynamic> failedTasks = await fetchCompletedTasks(context);
    return failedTasks.where((task) => task['is_done'] == false).toList();
  }
}
