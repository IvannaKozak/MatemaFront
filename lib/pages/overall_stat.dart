import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';

import 'package:matemafront/widgets/stat_chart.dart';

class OverallStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double chartHeight = MediaQuery.of(context).size.height*0.37;
    EdgeInsets chartWidth() {
      double width = MediaQuery.of(context).size.width*0.37;
      return EdgeInsets.only(top: 0.05*chartHeight, left: 0.22*width, right: 0.22*width);
    } 

    return Scaffold(
      backgroundColor: AppColors.verylightBackground,
      body: Column(
        children: [
          Container(
            margin: chartWidth(),
            height: chartHeight,
            child: MyBarChart(),
          ),
        ],
      ),
    );
  }
}
