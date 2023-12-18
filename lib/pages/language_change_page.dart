import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class LanguageChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.verylightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.verylightBackground,
        leading: Container(
          height: 65,
          width: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/images/back_arrow.svg',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        child: const Text(
          'Мова',
          style: AppFonts.semiboldDark50,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
