import 'package:flutter/material.dart';
import 'package:matemafront/widgets/stat_tab_bar.dart';
import 'package:matemafront/widgets/stat_page_view.dart';

import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_fonts.dart';
import 'package:matemafront/utils/app_dimensions.dart';

class MyStatistic extends StatefulWidget {
  const MyStatistic({Key? key}) : super(key: key);

  @override
  MyStatisticState createState() => MyStatisticState();
}

class MyStatisticState extends State<MyStatistic>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: _selectedIndex);

    _pageController.addListener(_pageListener);
  }

  void _pageListener() {
    setState(() {
      _selectedIndex = _pageController.page!.round();
      _tabController.animateTo(_selectedIndex);
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.verylightBackground,
      appBar: AppBar(
        toolbarHeight: AppDimensions.xl,
        titleSpacing: 0.0,
        title: const Align(
          alignment:
              Alignment.centerLeft,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: AppDimensions.xxxs,
                  ),
                  Text(
                    'Статистика',
                    style: AppFonts.semiboldDark50,
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.verylightBackground,
        elevation: AppDimensions.t,
        bottom: MyTabBar(
          tabController: _tabController,
          selectedIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
      body: MyPageView(
        pageController: _pageController,
        selectedIndex: _selectedIndex,
        scrollController: _pageController,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }
}
