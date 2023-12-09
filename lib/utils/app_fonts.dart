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

  static const TextStyle semiboldWhite13 = TextStyle(
    fontFamily: 'Inter-SemiBold',
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static const TextStyle semiboldWhite20 = TextStyle(
    fontFamily: 'Inter-SemiBold',
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static const TextStyle semiboldDark16 = TextStyle(
    fontFamily: 'Inter-SemiBold',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static const TextStyle semiboldDark18 = TextStyle(
    fontFamily: 'Inter-SemiBold',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static const TextStyle semiboldDark20 = TextStyle(
    fontFamily: 'Inter-SemiBold',
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static const TextStyle semiboldDark24 = TextStyle(
    fontFamily: 'Inter-SemiBold',
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static const TextStyle semiboldDark45 = TextStyle(
    fontFamily: 'Inter-SemiBold',
    fontSize: 45.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static const TextStyle semiboldDark50 = TextStyle(
    fontFamily: 'Inter-SemiBold',
    fontSize: 50.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static const TextStyle semiboldDark15 = TextStyle(
    fontFamily: 'Inter-SemiBold',
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static TextStyle semiboldDark24_ = TextStyle(
    fontFamily: 'Inter-SemiBold',
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor.withOpacity(0.4),
  );

  static TextStyle semibold15({Color? color}) {
    return TextStyle(
      fontFamily: 'Inter-SemiBold',
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }
}
