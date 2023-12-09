import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_fonts.dart';

class Data {
  Data({
    required this.id,
    required this.y,
    this.color = AppColors.appGreen,
  }) {
    DateTime date = DateTime.now();
    int todayId = date.weekday;

    TextStyle purpleSemibold15() {
      return const TextStyle(
        fontFamily: 'Inter-SemiBold',
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.appPurple,
      );
    }

    TextStyle nameStyle;

    if (id == todayId) {
      color = AppColors.appPurple;
      nameStyle = purpleSemibold15();
    } else {
      color = AppColors.appGreen;
      nameStyle = AppFonts.semiboldDark15;
    }

    switch (id) {
      case 1:
        name = Text('Пн', style: nameStyle);
        break;
      case 2:
        name = Text('Вт', style: nameStyle);
        break;
      case 3:
        name = Text('Ср', style: nameStyle);
        break;
      case 4:
        name = Text('Чт', style: nameStyle);
        break;
      case 5:
        name = Text('Пт', style: nameStyle);
        break;
      case 6:
        name = Text('Сб', style: nameStyle);
        break;
      case 7:
        name = Text('Нд', style: nameStyle);
        break;
      default:
        name = Text('', style: nameStyle);
        break;
    }
  }

  final int id;
  final double y;
  late Color color;
  late Widget name;
}
