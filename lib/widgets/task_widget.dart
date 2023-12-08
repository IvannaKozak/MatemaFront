import 'package:flutter/material.dart';
import 'package:matemafront/models/task_model.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key, required this.task}) : super(key: key);
  final Task task;

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
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(AppDimensions.xxxxs),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.name,
                        style: AppFonts.boldDark26,
                      ),
                      const SizedBox(height: AppDimensions.xxxt),
                      Text(
                        task.theme,
                        style: AppFonts.semiboldDark20,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 60,
                decoration: const BoxDecoration(
                  color: AppColors.appPurple,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  '+${task.point}',
                  style: AppFonts.boldWhite26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
