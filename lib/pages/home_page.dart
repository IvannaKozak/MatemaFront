import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matemafront/api/api_service_home_page.dart';
import 'package:matemafront/models/task_model.dart';
import 'package:matemafront/widgets/score_bar.dart';
import 'package:matemafront/widgets/task_widget.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          child: Column(
            children: [
              Row(
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
              // const SizedBox(
              //   height: AppDimensions.xxxxs,
              // ),
            ],
          ),
        ),
        backgroundColor: AppColors.verylightBackground,
        elevation: AppDimensions.t,
      ),
      backgroundColor: AppColors.verylightBackground,
      body: FutureBuilder<List<Task>>(
        // Using FutureBuilder to handle async data
        future: _apiService.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tasks found'));
          } else {
            // The tasks are loaded, build your widgets using snapshot.data
            return RawScrollbar(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 11),
              thumbVisibility: true,
              thickness: 6,
              radius: const Radius.circular(20),
              thumbColor: AppColors.textColor,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Task task = snapshot.data![index];
                  return TaskWidget(
                      task: task); // Assuming TaskWidget takes a Task object
                },
              ),
            );
          }
        },
      ),
    );
  }
}
