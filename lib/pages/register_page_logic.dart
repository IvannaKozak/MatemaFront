import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';
import 'package:matemafront/pages/confirm_email.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController first_nameController = TextEditingController();
  TextEditingController last_nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController re_passwordController = TextEditingController();

  Future<void> registerUser() async {
    if (usernameController.text.isEmpty ||
        first_nameController.text.isEmpty ||
        last_nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        re_passwordController.text.isEmpty) {
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
    if (passwordController.text != re_passwordController.text) {
      // Показати помилку, якщо паролі не збігаються
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Помилка'),
          content: const Text('Упс..Паролі не збігаються.'),
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
      Uri.parse('https://matema-dev-ncrzmugb6q-lm.a.run.app/auth/users/'),
      body: json.encode({
        'username': usernameController.text,
        'first_name': first_nameController.text,
        'last_name': last_nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        're_password': re_passwordController.text,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    // Читання відповіді
    var message = json.decode(response.body);

    if (response.statusCode == 201 || response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Confirm_email(username: usernameController.text),
        ),
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
        backgroundColor: AppColors.verylightBackground,
        elevation: AppDimensions.t,
      ),
      backgroundColor: AppColors.verylightBackground,
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
                        'Приємно познайомитися, \n створіть свій обліковий запис;)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 35),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Нікнейм',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
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
                        controller: usernameController,
                        decoration: const InputDecoration(
                          hintText: 'Нікнейм',
                          filled: true,
                          fillColor: AppColors.white,
                          border: InputBorder.none,
                          // enabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide.none,
                          //   borderRadius: BorderRadius.only(
                          //     topLeft: Radius.zero,
                          //     bottomLeft: Radius.zero,
                          //     topRight: Radius.circular(10),
                          //     bottomRight: Radius.circular(10),
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.xxxxs),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Ім`я',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: first_nameController,
                      decoration: const InputDecoration(
                        hintText: 'Ім`я',
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
                    const SizedBox(height: AppDimensions.xxxxs),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Прізвище',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: last_nameController,
                      decoration: const InputDecoration(
                        hintText: 'Прізвище',
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
                    const SizedBox(height: AppDimensions.xxxxs),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
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
                    const SizedBox(height: AppDimensions.xxxxs),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Пароль',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
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
                    const SizedBox(height: AppDimensions.xxxxs),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Повторити пароль',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: re_passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Повторити пароль',
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
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.xxxxs),
              Container(
                margin: const EdgeInsets.only(left: AppDimensions.m),
                width: 370,
                height: 80,
                child: ElevatedButton(
                  onPressed: registerUser,
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
                    'Зареєстуватися',
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
                    text: 'У вас вже є обліковий запис? ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      color: AppColors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Увійти',
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
//     home: RegisterScreen(),
//     routes: {
//       '/confirmEmail': (context) =>
//           Confirm_email(username: 'usernameController'),
//     },
//   ));
// }
