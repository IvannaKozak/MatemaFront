import 'package:flutter/material.dart';
import 'package:matemafront/pages/stat_done.dart';
import 'package:matemafront/pages/stat_not_done.dart';
import 'package:matemafront/pages/overall_stat.dart';

class MyPageView extends StatelessWidget {

  MyPageView({
    required this.pageController,
    required this.selectedIndex,
  });
  
  final PageController pageController;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        OverallStats(),
        const StatDone(),
        StatNotDone(),
      ],
    );
  }
}
