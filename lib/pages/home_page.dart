import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.lightBackground, // Set any color you want here.
    ));
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: AppDimensions.xxs,
        ),
        Row(
          children: const [
            SizedBox(
              width: AppDimensions.xxxs,
            ),
            Text(
              'MaTema',
              style: AppFonts.semibold50,
            ),
          ],
        )
      ],
    ));
  }
}
