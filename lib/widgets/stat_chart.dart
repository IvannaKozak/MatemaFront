import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:matemafront/models/statistic_chart_data_class.dart';
import 'package:matemafront/data/statistic_chart_data.dart';

import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_fonts.dart';

class MyBarChart extends StatelessWidget {
  final double barWidth = 30;

  SideTitles _leftTitles() {
    return SideTitles(
      showTitles: true,
      interval: 1,
      getTitlesWidget: (value, _) {
        final intValue = value.toInt();
        final firstDigit = intValue % 10;
        return Text(
          '$firstDigit',
          style: AppFonts.semiboldDark15,
        );
      },
    );
  }

  SideTitles _bottomTitles() {
    return SideTitles(
      showTitles: true,
      interval: 1,
      getTitlesWidget: (value, meta) {
        final int id = value.toInt();
        final data = BarData.barData.firstWhere(
          (element) => element.id == id,
          orElse: () => Data(id: 0, y: 0),
        );
        return Column(
          children: [
            Container(
              height: 4,
              width: 3,
              color: AppColors.black,
            ),
            data.name,
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          maxY: 6,
          minY: 0,
          groupsSpace: 12,
          titlesData: FlTitlesData(
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: _bottomTitles(),
            ),
            leftTitles: AxisTitles(
              sideTitles: _leftTitles(),
            ),
          ),
          gridData: FlGridData(
            drawVerticalLine: false,
            checkToShowHorizontalLine: (value) => value % 2 == 0,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                color: AppColors.black,
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            border: const Border(
              left: BorderSide(
                color: AppColors.black,
                width: 3,
              ),
              bottom: BorderSide(
                color: AppColors.black,
                width: 3,
              ),
            ),
          ),
          barGroups: BarData.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.id,
                  barRods: [
                    BarChartRodData(
                        toY: data.y,
                        width: barWidth,
                        color: data.color,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        backDrawRodData: BackgroundBarChartRodData(
                          show: false,
                          color: AppColors.appPurple,
                        )),
                  ],
                ),
              )
              .toList(),
        ),
      );
}
