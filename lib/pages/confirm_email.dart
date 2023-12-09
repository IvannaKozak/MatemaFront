import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';
import 'package:matemafront/pages/login_page.dart';
import 'package:http/http.dart' as http;

class Confirm_email extends StatelessWidget {
  final String username;
  Confirm_email({Key? key, required this.username}) : super(key: key);

  Future<void> confirmUser(BuildContext context) async {
    var response = await http.get(
      Uri.parse(
          'https://matema-dev-ncrzmugb6q-lm.a.run.app/user/check-user-active/$username/'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 401) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Помилка'),
          content: const Text('Ви не підтвердили електронну пошту.'),
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

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(left: AppDimensions.m),
              width: double.infinity,
              height: 120,
              padding: const EdgeInsets.only(left: 10, top: 16.0, bottom: 16.0),
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
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Підтвердіть свою електронну адресу',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Після цього увійдіть у свій акаунт',
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
              margin: const EdgeInsets.only(left: AppDimensions.m),
              width: 370,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  confirmUser(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 125, 86, 165),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Confirm_email(username: "yourUsername"),
    routes: {
      '/Login': (context) => LoginScreen(),
    },
  ));
}
