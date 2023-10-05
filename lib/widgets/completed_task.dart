import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class CompletedTaskWidget extends StatelessWidget {
  const CompletedTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: AppDimensions.xxs),
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
          Expanded(
            child: Container(
              height: AppDimensions.xl,
              decoration: const BoxDecoration(
                color: AppColors.appGreen,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: AppDimensions.xxxs),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Задача про метеликів',
                          style: AppFonts.boldDark26,
                        ),
                        SizedBox(height: AppDimensions.xxxt),
                        Text(
                          'Логічна задача',
                          style: AppFonts.semiboldDark20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/check_png.png',
                      width: AppDimensions.xs,
                      height: AppDimensions.xs,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
