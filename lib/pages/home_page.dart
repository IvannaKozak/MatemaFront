import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matemafront/widgets/completed_task.dart';

import 'package:matemafront/widgets/score_bar.dart';
import 'package:matemafront/widgets/task_widget.dart';

import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';
import 'package:matemafront/widgets/week_task_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.verylightBackground,
    ));
    return Scaffold(
        appBar: AppBar(
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
                  'MaTema',
                  style: AppFonts.semiboldDark50,
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
          children: [
            Expanded(
              child: RawScrollbar(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 0, right: 11),
                thumbVisibility: true,
                thickness: 6,
                radius: const Radius.circular(20),
                thumbColor: AppColors.textColor,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const [
                    SizedBox(
                      height: AppDimensions.xxxs,
                    ),
                    CompletedTaskWidget(),
                    SizedBox(
                      height: AppDimensions.xxxxs,
                    ),
                    TaskWidget(),
                    SizedBox(
                      height: AppDimensions.xxxxs,
                    ),
                    CompletedTaskWidget(),
                    SizedBox(
                      height: AppDimensions.xxxxs,
                    ),
                    TaskWidget(),
                    SizedBox(
                      height: AppDimensions.xxxxs,
                    ),
                    TaskWidget(),
                    SizedBox(
                      height: AppDimensions.xxxxs,
                    ),
                    TaskWidget(),
                    SizedBox(
                      height: AppDimensions.xxxxs,
                    ),
                    WeekTaskWidget(),
                    SizedBox(
                      height: AppDimensions.xxxxs,
                    ),
                  ],
                ),
              ),
            ),
            //const MyNavigationBar()
          ],
        ));
  }
}
