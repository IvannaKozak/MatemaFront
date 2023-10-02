import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_fonts.dart';

class ScoreBarWidget extends StatelessWidget {
  const ScoreBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 110.0,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
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
          Row(
            children: [
              Container(
                width: 30,
                decoration: const BoxDecoration(
                  color: AppColors.appPurple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'O',
                  style: AppFonts.boldWhite26,
                ),
              ),
              const Text(
                '1811',
                style: AppFonts.boldDark26,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
