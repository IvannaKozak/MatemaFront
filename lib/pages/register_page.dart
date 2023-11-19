import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class RegisterScreen extends StatelessWidget {
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
          //Padding(
          //padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Ім`я і Прізвище',
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
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Пошта',
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
                    const TextField(
                      decoration: InputDecoration(
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
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.xxxxs),
              Container(
                margin: const EdgeInsets.only(left: AppDimensions.m),
                width: 370,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {},
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

void main() {
  runApp(MaterialApp(
    home: RegisterScreen(),
  ));
}
