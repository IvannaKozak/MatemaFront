import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_fonts.dart';

class Data {
  final int id;
  final double y;
  final Color color = AppColors.appGreen;
  late Widget name;

  Data({
    required this.id,
    required this.y,
    color,
  }) {
    switch (id) {
      case 0:
        name = const Text('Пн', style: AppFonts.semiboldDark15);
        break;
      case 1:
        name = const Text('Вт', style: AppFonts.semiboldDark15);
        break;
      case 2:
        name = const Text('Ср', style: AppFonts.semiboldDark15);
        break;
      case 3:
        name = const Text('Чт', style: AppFonts.semiboldDark15);
        break;
      case 4:
        name = const Text('Пт', style: AppFonts.semiboldDark15);
        break;
      case 5:
        name = const Text('Сб', style: AppFonts.semiboldDark15);
        break;
      case 6:
        name = const Text('Пд', style: AppFonts.semiboldDark15);
        break;
      default:
        name = const Text('', style: AppFonts.semiboldDark15);
        break;
    }
  }
}
