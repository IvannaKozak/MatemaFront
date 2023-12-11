import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matemafront/api/api_service_home_page.dart';
import 'package:matemafront/models/theme_model.dart';
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
  final ApiService _apiService = ApiService();

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
              child: FutureBuilder<List<Topic>>(
                future: _apiService.getTopics(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data found'));
                  } else {
                    return RawScrollbar(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 0, left: 0, right: 11),
                      thumbVisibility: true,
                      thickness: 6,
                      radius: const Radius.circular(20),
                      thumbColor: AppColors.textColor,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Topic topic = snapshot.data![index];
                          return TopicWidget(topic: topic);
                        },
                      ),
                    );
                  }
                },
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
