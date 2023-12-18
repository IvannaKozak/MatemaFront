import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:matemafront/api/auth_service.dart';
import 'package:matemafront/api/secure_storage_service.dart';

Future<String> fetchUsername(BuildContext context) async {
  final String baseUrl = 'https://matema-dev-ncrzmugb6q-lm.a.run.app';

  await AuthService().verifyAndRefreshToken(context);

  // Retrieve the access token from secure storage
  var accessToken = await SecureStorageService().getToken('accessToken');

  if (accessToken == null) {
    throw Exception('Access Token is null, user needs to log in again.');
  }

  try {
    var accessToken = await SecureStorageService().getToken('accessToken');
    if (accessToken == null || accessToken.isEmpty) {
      throw Exception('Access token not found in secure storage');
    }

    // Verify and refresh the access token
    bool isTokenValid = await AuthService().verifyAndRefreshToken(context);
    if (!isTokenValid) {
      throw Exception('Access token verification failed');
    }

    // Make request to fetch username
    final response = await http.get(
      Uri.parse('$baseUrl/auth/users/me/'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> userData = json.decode(response.body);
      String username = userData['username'];
      return username;
    } else {
      throw Exception('Failed to fetch user data: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Error fetching username: $error');
  }
}

class UserProfile {
  final String firstName;
  final String lastName;
  final String username;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.username,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      username: json['username'] ?? '',
    );
  }
}

Future<UserProfile> fetchProfileUsernameAndFullname(BuildContext context) async {
  await AuthService().verifyAndRefreshToken(context);

  var accessToken = await SecureStorageService().getToken('accessToken');

  final response = await http.get(
    Uri.parse('https://matema-dev-ncrzmugb6q-lm.a.run.app/auth/users/me/'),
    headers: {'Authorization': 'Bearer $accessToken'},
  );

  if (accessToken == null) {
    throw Exception('Access Token is null, user needs to log in again.');
  }

  bool isTokenValid = await AuthService().verifyAndRefreshToken(context);
  if (!isTokenValid) {
    throw Exception('Access token verification failed');
  }

  if (response.statusCode == 200) {
    String utf8Body =
        utf8.decode(response.bodyBytes); 
    Map<String, dynamic> profileInfo =
        json.decode(utf8Body); 
    return UserProfile.fromJson(
        profileInfo); 
  } else {
    throw Exception('Failed to load profile information');
  }
}

Future<String> fetchProfileImage(BuildContext context) async {
  final response = await http
      .get(Uri.parse('https://matema-dev-ncrzmugb6q-lm.a.run.app/user/photo/'));

  await AuthService().verifyAndRefreshToken(context);

  // Retrieve the access token from secure storage
  var accessToken = await SecureStorageService().getToken('accessToken');

  if (accessToken == null) {
    throw Exception('Access Token is null, user needs to log in again.');
  }

  bool isTokenValid = await AuthService().verifyAndRefreshToken(context);
  if (!isTokenValid) {
    throw Exception('Access token verification failed');
  }

  if (response.statusCode == 200) {
    final imageUrl = json.decode(response.body)['imageUrl'];
    return imageUrl;
  } else {
    throw Exception('Failed to load image');
  }
}
