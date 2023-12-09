import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class FailedTaskWidget extends StatelessWidget {
  final String taskName;
  final String themeName;

  const FailedTaskWidget({
    Key? key,
    required this.taskName,
    required this.themeName,
  }) : super(key: key);

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
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: AppDimensions.xxxxs),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          taskName,
                          style: AppFonts.boldDark26,
                          overflow: TextOverflow.ellipsis, 
                        ),
                        const SizedBox(height: AppDimensions.xxxt),
                        Text(
                          themeName,
                          style: AppFonts.semiboldDark20,
                          overflow: TextOverflow.ellipsis, 
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 20,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
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
