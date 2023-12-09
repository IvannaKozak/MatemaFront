import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:matemafront/api/api_service_fetch_username.dart';

class StatDoneService {
  final String baseUrl = 'https://matema-dev-ncrzmugb6q-lm.a.run.app';

  Future<List<dynamic>> fetchCompletedTasks() async {
    Future<String> username = fetchUsername();
    var url = Uri.parse("$baseUrl/statistic/userdone/$username");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}
