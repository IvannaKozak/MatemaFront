import 'package:flutter/material.dart';
import 'package:matemafront/widgets/task_widget_clear.dart';

import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class StatNotDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.verylightBackground,
        body: Column(
          children: [
            const Align(
              heightFactor: 2.5,
              widthFactor: 0.95,
              alignment: Alignment
                  .centerLeft,
              child: Row(
                children: [
                  Text(
                    'Історія за останні 30 днів',
                    style: AppFonts.semiboldDark20,
                  ),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  SizedBox(
                    height: AppDimensions.xxxxs,
                  ),
                  TaskWidgetClear(),
                  SizedBox(
                    height: AppDimensions.xxxxs,
                  ),
                  TaskWidgetClear(),
                  SizedBox(
                    height: AppDimensions.xxxxs,
                  ),
                  TaskWidgetClear(),
                  SizedBox(
                    height: AppDimensions.xxxxs,
                  ),
                  TaskWidgetClear(),
                  SizedBox(
                    height: AppDimensions.xxxxs,
                  ),
                  TaskWidgetClear(),
                  SizedBox(
                    height: AppDimensions.xxxxs,
                  ),
                  TaskWidgetClear(),
                  SizedBox(
                    height: AppDimensions.xxxxs,
                  ),
                  TaskWidgetClear(),
                  SizedBox(
                    height: AppDimensions.xxxxs,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
