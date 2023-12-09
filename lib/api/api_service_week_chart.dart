import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:matemafront/models/week_chart_data_model.dart';
import 'package:matemafront/api/api_service_fetch_username.dart';

class ChartData {
  static int interval = 2;
  static List<Data> barData = [];
  final String baseUrl = 'https://matema-dev-ncrzmugb6q-lm.a.run.app';

  Future<void> fetchChartData() async {
    Future<String> username = fetchUsername();
    final response = await http.get(Uri.parse('$baseUrl/statistic/week/$username'));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> jsonData =
          List<Map<String, dynamic>>.from(json.decode(response.body));

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
  }
}
