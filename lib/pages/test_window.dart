import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';

class TestWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Ліва кнопка
                  Container(
                    margin: const EdgeInsets.only(right: AppDimensions.m),
                    width: 200,
                    height: 80,
                    padding: const EdgeInsets.only(
                        right: 10, top: 16.0, bottom: 16.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 249),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const Text(
                            'Задачка про книги',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text(
                            'Проста арифметика',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Права кнопка
                  Container(
                    margin: const EdgeInsets.only(left: AppDimensions.m),
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.only(
                        left: 10, top: 16.0, bottom: 16.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 249),
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
                            '+5',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 370,
                height: 375,
                decoration: BoxDecoration(
                  color: Colors.blue, // Виберіть колір фону
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/matem.png', fit: BoxFit.cover),

                    const SizedBox(
                        height: 20), // Додає простір між текстом і зображенням
                    const Text(
                      'Хлопчик купив книгу з обгорткою за 11 гривень. За саму книгу він віддав '
                      'на 10 гривень більше вартості обкладинки. Назвіть окремо ціну '
                      'книги і обкладинки.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
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
                          hintText: '173',
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
                    'Відповісти',
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
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TestWindow(),
  ));
}
