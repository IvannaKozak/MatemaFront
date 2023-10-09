import 'package:flutter/material.dart';
import 'package:matemafront/pages/home_page.dart';
import 'package:matemafront/utils/app_colors.dart';

int currentIndex = 0;

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
      child: const Text('Статистика'),
    ),
    Container(
      child: const Text('Статистика'),
    ),
    const MyHomePage(),
    Container(
      child: const Text('Статистика'),
    ),
    Container(
      child: const Text('Статистика'),
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
          items: [
            const BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: Icon(Icons.home),
              label: 'Головна',
            ),
            const BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: Icon(Icons.search),
              label: 'Пошук',
            ),
            const BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: Icon(Icons.library_books),
              label: 'Бібліотека',
            ),
            const BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: Icon(Icons.person),
              label: 'Профіль',
            ),
            const BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: Icon(Icons.person),
              label: 'Профіль',
            ),
          ],
        ),
      ),
    );
  }
}
