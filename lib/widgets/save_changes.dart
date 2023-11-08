import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class SaveChangesWidget extends StatelessWidget {
  const SaveChangesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: AppDimensions.xxs),
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
              height: AppDimensions.m,
              decoration: const BoxDecoration(
                color: AppColors.appPurple,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Зберегти зміни',
                    style: AppFonts.boldWhite26,
                  ),
                  const SizedBox(height: AppDimensions.xxxt),
                  const Text(
                    '*зміни вступлять в дію завтра',
                    style: AppFonts.semiboldWhite13,
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
