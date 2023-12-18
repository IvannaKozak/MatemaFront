import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/widgets/task_for_statview.dart';
import 'package:matemafront/api/api_service_task_history.dart';

class StatDone extends StatefulWidget {
  const StatDone({Key? key}) : super(key: key);

  @override
  _StatDoneState createState() => _StatDoneState();
}

class _StatDoneState extends State<StatDone> {
  late Future<List<dynamic>> completedTasks;

  // @override
  // void initState() {
  //   super.initState();
  //   completedTasks = [
  //     {
  //       "task": "Task 1",
  //       "theme": "Theme 1",
  //       "is_done": true,
  //       "datetime": "2023-12-15 10:30:00"
  //     },
  //     {
  //       "task": "Task 2",
  //       "theme": "Theme 2",
  //       "is_done": false,
  //       "datetime": "2023-12-16 15:45:00"
  //     },
  //     // Add more sample tasks as needed...
  //   ];
  // }

  @override
  void initState() {
    super.initState();
    completedTasks = TaskStatService().getCompletedTasks(context);
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
            child: FutureBuilder<List<dynamic>>(
              future: completedTasks,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No completed tasks available'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      DateTime parsedDate = DateTime.tryParse(
                              snapshot.data![index]['datetime']) ??
                          DateTime.now();

                      return Column(
                        children: [
                          CompletedTaskWidget(
                            taskName: snapshot.data![index]['task'],
                            isDone: snapshot.data![index]['is_done'] ?? false,
                            completionDate: parsedDate,
                            mark: snapshot.data![index] ['mark'],
                          ),
                          const SizedBox(height: AppDimensions.xxxxs),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
