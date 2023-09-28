import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';

class AppFonts {
  AppFonts._();

  static const TextStyle boldDark26 = TextStyle(
    fontFamily: 'Inter-Bold',
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static const TextStyle boldWhite26 = TextStyle(
    fontFamily: 'Inter-Bold',
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static const TextStyle semiboldWhite20 = TextStyle(
    fontFamily: 'Inter-SemiBold',
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static const TextStyle semiboldDark20 = TextStyle(
    fontFamily: 'Inter-SemiBold',
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static const TextStyle semiboldDark50 = TextStyle(
    fontFamily: 'Inter-SemiBold',
    fontSize: 50.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );
}
