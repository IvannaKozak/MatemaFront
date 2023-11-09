import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matemafront/widgets/how_many_tasks.dart';
import 'package:matemafront/widgets/save_changes.dart';
import 'package:matemafront/widgets/score_bar.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';
import 'package:matemafront/widgets/topic_widget.dart';

class MyChoicePage extends StatefulWidget {
  const MyChoicePage({super.key});

  @override
  State<MyChoicePage> createState() => _MyChoicePageState();
}

class _MyChoicePageState extends State<MyChoicePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.verylightBackground,
    ));
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: AppDimensions.xl,
          titleSpacing: 0.0,
          title: Align(
            alignment:
                Alignment.centerLeft, // for ios because there is in the middle
            child: Row(
              children: [
                const SizedBox(
                  width: AppDimensions.xxxs,
                ),
                const Text(
                  'Вибір тем',
                  style: AppFonts.semiboldDark45,
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 0.0),
                  child: ScoreBarWidget(),
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.verylightBackground,
          elevation: AppDimensions.t,
        ),
        backgroundColor: AppColors.verylightBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppDimensions.xxs,
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: AppDimensions.xxxs, bottom: AppDimensions.xxxxs),
              child: Text(
                'Кількість задач на день:',
                style: AppFonts.semiboldDark20,
              ),
            ),
            TasksSlider(),
            const SizedBox(
              height: AppDimensions.xxxxs,
            ),
            Expanded(
              child: RawScrollbar(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 0, right: 11),
                thumbVisibility: true,
                thickness: 6,
                radius: const Radius.circular(20),
                thumbColor: AppColors.textColor,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount:
                      16, // 7 TopicWidgets + 7 SizedBox widgets = 14; but since they are paired together, we need only 8 iterations
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return const SizedBox(
                        height: AppDimensions.xxxs,
                      );
                    }

                    // Every odd index is a TopicWidget
                    if (index.isOdd) {
                      return const TopicWidget();
                    }

                    // Every even index (excluding the first one) is a SizedBox
                    return const SizedBox(
                      height: AppDimensions.xxxs,
                    );
                  },
                ),
              ),
            ),
            const SaveChangesWidget(),
            const SizedBox(
              height: AppDimensions.xxs,
            )
          ],
        ));
  }
}
