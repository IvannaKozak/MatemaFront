import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:matemafront/api/secure_storage_service.dart';
import 'package:matemafront/pages/login_page.dart';

class AuthService {
  final String _baseUrl = 'https://matema-dev-ncrzmugb6q-lm.a.run.app';

  // Function to verify and refresh the access token
  Future<bool> verifyAndRefreshToken(BuildContext context) async {
    print('Verifying access token.');
    var accessToken = await SecureStorageService().getToken('accessToken');

    if (accessToken != null && !await _isAccessTokenValid(accessToken)) {
      // If access token is not valid, try to refresh it
      print('Access token is invalid, refreshing token.');
      await _refreshAccessToken(context);
      return true;
    } else {
      print('Access token is valid.');
      return true;
    }
  }

  // Private function to check access token validity
  Future<bool> _isAccessTokenValid(String accessToken) async {
    var response = await http.post(
      Uri.parse('$_baseUrl/auth/jwt/verify/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'token': accessToken}),
    );

    return response.statusCode == 200;
  }

  // Private function to refresh the access token
  Future<void> _refreshAccessToken(BuildContext context) async {
    var refreshToken = await SecureStorageService().getToken('refreshToken');
    print('Attempting to refresh access token.');

    if (refreshToken != null) {
      var response = await http.post(
        Uri.parse('$_baseUrl/auth/jwt/refresh/'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'refresh': refreshToken}),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        await SecureStorageService().storeToken('accessToken', data['access']);
      } else {
        // Refresh token is also invalid, redirect to login
        print('Refresh token is invalid, redirecting to login.');
        _redirectToLogin(context);
      }
    } else {
      // No refresh token available, redirect to login
      print('No refresh token available, redirecting to login.');
      _redirectToLogin(context);
    }
  }

  // Redirect user to the login page
  void _redirectToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
