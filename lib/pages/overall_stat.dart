import 'package:flutter/material.dart';

import 'package:matemafront/utils/app_colors.dart';

import 'package:matemafront/widgets/stat_chart.dart';
import 'package:matemafront/api/api_service_week_chart.dart';
//import 'package:matemafront/data/statistic_chart_data.dart';

class OverallStats extends StatefulWidget {
  @override
  _OverallStatsState createState() => _OverallStatsState();
}

class _OverallStatsState extends State<OverallStats> {
  bool isLoading = true;
  bool hasError = false;
  ChartData chartData = ChartData();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    try {
      await chartData.fetchChartData();
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      print('Error loading data: $error');
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });
    try {
      await chartData.fetchChartData();
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      print('Error refreshing data: $error');
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double chartHeight = MediaQuery.of(context).size.height * 0.37;
    EdgeInsets chartWidth() {
      double width = MediaQuery.of(context).size.width * 0.15;
      return EdgeInsets.only(
          top: 0.05 * chartHeight, left: 0.22 * width, right: 0.22 * width);
    }

    return Scaffold(
      backgroundColor: AppColors.verylightBackground,
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: AppColors.lightBackground,
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            child: Container(
              margin: chartWidth(),
              height: chartHeight,
              child: hasError
                  ? const Center(
                      child: Icon(
                      Icons.cloud_off_rounded,
                      size: 100,
                    ))
                  : isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.appPurple,
                          ),
                        )
                      : MyBarChart(),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.topEnd,
            child: ElevatedButton(
              onPressed: () {
                refreshData();
              },
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColors.appPurple),
                  shape: MaterialStatePropertyAll(CircleBorder())),
              child: const Icon(Icons.refresh_rounded, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
