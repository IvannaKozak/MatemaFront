import 'package:flutter/material.dart';

import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';

import 'package:matemafront/widgets/failed_task_for_statview.dart';
import 'package:matemafront/api/api_service_stat_failed.dart';

class StatNotDone extends StatefulWidget {
  const StatNotDone({Key? key}) : super(key: key);

  @override
  _StatNotDoneState createState() => _StatNotDoneState();
}

class _StatNotDoneState extends State<StatNotDone> {
  List<dynamic> notCompletedTasks = [];
  final StatNotDoneService _notCompletedTasksService = StatNotDoneService();

  Future<void> fetchNotCompletedTasks() async {
    try {
      List<dynamic> tasks = await _notCompletedTasksService.fetchNotCompletedTasks();
      setState(() {
        notCompletedTasks = tasks;
      });
    } catch (error) {
      print('Помилка отримання даних: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNotCompletedTasks();
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
              itemCount: notCompletedTasks.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    FailedTaskWidget(
                      taskName: notCompletedTasks[index]['task_id'],
                      themeName: notCompletedTasks[index]['theme_name'],
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
