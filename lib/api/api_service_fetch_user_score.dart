import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:matemafront/api/auth_service.dart';
import 'package:matemafront/api/secure_storage_service.dart';

Future<String> fetchUserScore(BuildContext context) async {
  await AuthService().verifyAndRefreshToken(context);

  var accessToken = await SecureStorageService().getToken('accessToken');

  final String url = 'https://matema-dev-ncrzmugb6q-lm.a.run.app/user/score/';

  try {
    if (accessToken == null) {
      throw Exception('Access Token is null, user needs to log in again.');
    }

    bool isTokenValid = await AuthService().verifyAndRefreshToken(context);
    if (!isTokenValid) {
      throw Exception('Access token verification failed');
    }

    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body);

      int userScore = userData['score'] as int;
      return userScore.toString();
    } else {
      return 'Nun';
    }
  } catch (e) {
    print('Error fetching user score: $e');
    return 'Nun';
  }
}
