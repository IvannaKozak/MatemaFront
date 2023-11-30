import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matemafront/widgets/reload_button.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({super.key});

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
    ));
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: AppDimensions.xl,
          titleSpacing: 0.0,
          title: Align(
            alignment:
                Alignment.centerLeft, // for ios because there is in the middle
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: AppDimensions.xxxs,
                    ),
                    const Text(
                      'MaTema',
                      style: AppFonts.semiboldDark50,
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right: 0.0),
                      child: ReloadButton(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.white,
          elevation: AppDimensions.t,
        ),
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: AppDimensions.xl,
                        ),
                        const Text(
                          'Немає зв\'язку з інтернетом',
                          style: AppFonts.semiboldDark18,
                        ),
                        const SizedBox(
                          height: AppDimensions.xl,
                        ),
                        Image.asset(
                          'assets/images/dino.png',
                          width: 200, // Set your desired width
                          height: 200, // Set your desired height
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
