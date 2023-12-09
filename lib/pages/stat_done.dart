import 'package:flutter/material.dart';

import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';

import 'package:matemafront/widgets/completed_task_for_statview.dart';
import 'package:matemafront/api/api_service_stat_done.dart';

class StatDone extends StatefulWidget {
  const StatDone({Key? key}) : super(key: key);

  @override
  _StatDoneState createState() => _StatDoneState();
}

class _StatDoneState extends State<StatDone> {
  List<dynamic> completedTasks = [];
  final StatDoneService _completedTasksService = StatDoneService();

  Future<void> fetchCompletedTasks() async {
    try {
      List<dynamic> tasks = await _completedTasksService.fetchCompletedTasks();
      setState(() {
        completedTasks = tasks;
      });
    } catch (error) {
      print('Помилка отримання даних: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCompletedTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.verylightBackground,
      body: Column(
        children: [
          const Align(
            heightFactor: 2.5,
            widthFactor: 0.95,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  'Історія за останні 30 днів',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CompletedTaskWidget(
                      taskName: completedTasks[index]['task_id'],
                      themeName: completedTasks[index]['theme_name'],
                    ),
                    const SizedBox(height: AppDimensions.xxxxs),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
