import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';

class BadResultPage extends StatefulWidget {
  const BadResultPage({super.key});

  @override
  State<BadResultPage> createState() => _BadResultPageState();
}

class _BadResultPageState extends State<BadResultPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Результат', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          const Text(
            'Неправильно',
            style: TextStyle(
              color: Colors.black,
              fontSize: 34,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Image.asset(
              'assets/images/cat.png',
              width: 290, // Set your desired width
              height: 290, // Set your desired height
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(right: AppDimensions.m),
            width: 420,
            height: 70,
            padding: const EdgeInsets.all(0.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle statistics action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 125, 86, 165),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.zero,
                    bottomLeft: Radius.zero,
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              child: const Text(
                'Спробувати ще раз',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.only(left: AppDimensions.m),
            width: 420,
            height: 70,
            padding: const EdgeInsets.all(0.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle statistics action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 125, 86, 165),
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
                'На головну',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
