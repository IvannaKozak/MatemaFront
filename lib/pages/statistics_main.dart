import 'package:flutter/material.dart';
import 'package:matemafront/widgets/stat_tab_bar.dart';
import 'package:matemafront/widgets/stat_page_view.dart';

import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_fonts.dart';

class MyTabs extends StatefulWidget {
  const MyTabs({super.key});

  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: _selectedIndex);
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
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                'Статистика',
                style: AppFonts.semiboldDark50,
              ),
              Spacer(),
            ],
          ),
        ),
        bottom: MyTabBar(
          tabController: _tabController,
          selectedIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
      body: MyPageView(
        pageController: _pageController,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
