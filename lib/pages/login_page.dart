import 'package:flutter/material.dart';
import 'package:matemafront/api/secure_storage_service.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';
import 'package:matemafront/pages/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:matemafront/widgets/navigation_bar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  Future<void> loginUser() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Помилка'),
          content: const Text('Будь ласка, заповніть всі поля.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
      return;
    }

    var response = await http.post(
      Uri.parse('https://matema-dev-ncrzmugb6q-lm.a.run.app/auth/jwt/create/'),
      body: json.encode({
        'password': passwordController.text,
        'username': usernameController.text,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    // Читання відповіді
    var message = json.decode(response.body);

    if (response.statusCode == 201 || response.statusCode == 200) {
      String accessToken = message['access'];
      String refreshToken = message['refresh'];

      await SecureStorageService().storeToken('accessToken', accessToken);
      await SecureStorageService().storeToken('refreshToken', refreshToken);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MyNavigationBar()),
        (route) => false,
      );
    } else {
      // Показати діалогове вікно з помилкою від сервера
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Помилка'),
          content: Text(message['error'] ?? 'Сталася помилка'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'MaTema',
            style: AppFonts.semiboldDark50,
          ),
        ),
        backgroundColor: AppColors.lightBackground,
        elevation: AppDimensions.t,
      ),
      backgroundColor: AppColors.lightBackground,
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(left: AppDimensions.m),
                width: double.infinity,
                height: 115,
                padding:
                    const EdgeInsets.only(left: 10, top: 16.0, bottom: 16.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 213, 255, 123),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const Text(
                        'Привіт друже 👋',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.purple,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      const Text(
                        'З поверненням, увійдіть у ваш обліковий запис',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Container(
                margin: const EdgeInsets.only(right: AppDimensions.m),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          hintText: 'Пароль',
                          filled: true,
                          fillColor: AppColors.white,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              bottomLeft: Radius.zero,
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.xxxxs),
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        hintText: 'Нікнейм',
                        filled: true,
                        fillColor: AppColors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            bottomLeft: Radius.zero,
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.t),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Забули пароль?',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.appPurple,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: AppDimensions.m),
                width: 370,
                height: 80,
                child: ElevatedButton(
                  onPressed: loginUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 125, 86, 165),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Увійти',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.xxxs),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1, // Specify the thickness of the Divider
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Або',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Colors
                            .grey, // Adjust the color to match your design
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1, // Specify the thickness of the Divider
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.xxxs),
              Container(
                margin: const EdgeInsets.only(right: AppDimensions.xxs),
                width: 370,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.mail_outline, color: Colors.black),
                  label: const Text(
                    'Вхід з Google',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF6B7280),
                    backgroundColor: Colors.white,
                    //padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(right: AppDimensions.xxs),
                width: 370,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.apple, color: Colors.black),
                  label: const Text(
                    'Вхід з Apple',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF6B7280),
                    backgroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.xxs),
              TextButton(
                onPressed: () {},
                child: RichText(
                  text: const TextSpan(
                    text: 'У вас ще немає облікового запису? ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      color: AppColors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Створіть його.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: AppColors.appPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: LoginScreen(),
//     routes: {
//       '/navPage': (context) => const MyNavigationBar(),
//     },
//   ));
// }
