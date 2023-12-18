import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:matemafront/api/api_service_fetch_user_data.dart';
import 'package:matemafront/models/week_chart_data_model.dart';
import 'package:matemafront/api/secure_storage_service.dart';

class ChartData {
  static int interval = 2;
  static List<Data> barData = [];
  final String baseUrl = 'https://matema-dev-ncrzmugb6q-lm.a.run.app';

  SecureStorageService secureStorageService = SecureStorageService();

  Future<void> fetchChartData(BuildContext context) async {
    try {
      String? username = await fetchUsername(context); 

      final response = await http.get(
        Uri.parse('$baseUrl/statistic/task/week/$username'),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        
        barData = jsonData.map((data) {
          DateTime date = DateTime.parse(data['day']);
          int id = date.weekday;

          return Data(
            id: id,
            y: data['count'].toDouble(),
          );
        }).toList();
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching chart data: $e');
    }
  }
}
