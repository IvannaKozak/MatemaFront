import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matemafront/pages/adminpanel/view_all.dart';
import 'package:matemafront/pages/choose_topics_page.dart';
import 'package:matemafront/pages/home_page.dart';
import 'package:matemafront/pages/profile_page.dart';
import 'package:matemafront/pages/register_page.dart';
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
    MyProfilePage(),
    const MyStatistic(),
    const MyHomePage(),
    // RegisterScreen(),
    // const NoInternetPage(),
    Container(
      child: const Text(
        'Рейтинг',
        style: AppFonts.semiboldDark50,
      ),
      alignment: Alignment.center,
    ),
    const MyChoicePage(),
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
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.appPurple,
        unselectedItemColor: AppColors.textColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          _buildNavItem('assets/images/profile.svg', 0),
          _buildNavItem('assets/images/statistics.svg', 1),
          _buildNavItem('assets/images/home.svg', 2),
          _buildNavItem('assets/images/leaderboard.svg', 3),
          _buildNavItem('assets/images/topic_change.svg', 4),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (currentIndex) {
      case 0:
        return MyProfilePage();
      case 1:
        return MyStatistic();
      case 2:
        return MyHomePage();
      case 3:
        return Container(
          child: const Text(
            'Рейтинг',
            style: AppFonts.semiboldDark50,
          ),
          alignment: Alignment.center,
        );
      case 4:
        return const MyChoicePage();
      default:
        return Container();
    }
  }

  BottomNavigationBarItem _buildNavItem(String imagePath, int index) {
    return BottomNavigationBarItem(
      icon: ColorFiltered(
        colorFilter: ColorFilter.mode(
          currentIndex == index ? AppColors.appPurple : AppColors.textColor,
          BlendMode.srcIn,
        ),
        child: SvgPicture.asset(
          imagePath,
          height: 45,
          width: 45,
        ),
      ),
      label: '',
    );
  }
}
