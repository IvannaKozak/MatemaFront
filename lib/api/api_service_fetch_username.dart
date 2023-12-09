import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchUsername() async {
  String username = '';
  final String baseUrl = 'https://matema-dev-ncrzmugb6q-lm.a.run.app';

  var url = Uri.parse('$baseUrl/auth/users/');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    username = responseData['username'];
  } else {
    throw Exception('Request failed with status: ${response.statusCode}');
  }

  return username;
}
