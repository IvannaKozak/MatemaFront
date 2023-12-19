import 'package:flutter/material.dart';
import 'package:matemafront/pages/stat_done.dart';
import 'package:matemafront/pages/stat_failed.dart';
import 'package:matemafront/pages/overall_stat.dart';

class MyPageView extends StatelessWidget {
  MyPageView({
    required this.pageController,
    required this.selectedIndex,
    required ScrollController scrollController,
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
        const StatFailed(),
      ],
    );  
  }
}
