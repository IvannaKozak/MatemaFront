import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: AppDimensions.xxs,
        top: AppDimensions.xxxt,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: AppDimensions.m,
            width: AppDimensions.xxxxl,
            decoration: const BoxDecoration(
              color: AppColors.appGreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Вилогуватись',
                  style: AppFonts.boldDark26,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
