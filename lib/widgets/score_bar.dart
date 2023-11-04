import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScoreBarWidget extends StatelessWidget {
  const ScoreBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.xxxm,
      width: 120.0,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            decoration: const BoxDecoration(
              color: AppColors.appPurple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/images/icon_100_svg.svg',
              width: 30,
              height: 30,
            ),
          ),
          const Text(
            '1811',
            textAlign: TextAlign.center,
            style: AppFonts.boldDark26,
          ),
        ],
      ),
    );
  }
}
