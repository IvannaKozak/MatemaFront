import 'package:flutter/material.dart';
import 'package:matemafront/pages/home_page.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/pages/statistics_main.dart';
import 'package:matemafront/utils/app_fonts.dart';

int currentIndex = 2;

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({
    Key? key,
  }) : super(key: key);
  static const routeName = '/navPage';

  @override
  NavPageState createState() => NavPageState();
}

class NavPageState extends State<MyNavigationBar> {
  late final List<Widget> _children = [
    Container(
      child: const Text(
        'Профіль',
        style: AppFonts.semiboldDark50,
      ),
      alignment: Alignment.center,
    ),
    const MyStatistic(),
    const MyHomePage(),
    Container(
      child: const Text(
        'Рейтинг',
        style: AppFonts.semiboldDark50,
      ),
      alignment: Alignment.center,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text(
        'Вибір тем',
        style: AppFonts.semiboldDark50,
      ),
    ),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _children[currentIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: currentIndex,
          selectedItemColor: AppColors.appPurple,
          unselectedItemColor: AppColors.textColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
                backgroundColor: AppColors.white,
                icon: ImageIcon(
                  AssetImage('assets/images/profile.png'),
                  size: 48,
                ),
                label: ''),
            const BottomNavigationBarItem(
                backgroundColor: AppColors.white,
                icon: ImageIcon(
                  AssetImage('assets/images/statistics.png'),
                  size: 48,
                ),
                label: ''),
            const BottomNavigationBarItem(
                backgroundColor: AppColors.white,
                icon: ImageIcon(
                  AssetImage('assets/images/home.png'),
                  size: 48,
                ),
                label: ''),
            const BottomNavigationBarItem(
                backgroundColor: AppColors.white,
                icon: ImageIcon(
                  AssetImage('assets/images/leaderboard.png'),
                  size: 48,
                ),
                label: ''),
            const BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: ImageIcon(
                AssetImage('assets/images/topic_change.png'),
                size: 48,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
