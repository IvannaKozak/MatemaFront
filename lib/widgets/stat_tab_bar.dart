import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class MyTabBar extends StatelessWidget implements PreferredSizeWidget {

  MyTabBar({
    required this.tabController,
    required this.selectedIndex,
    required this.onTabTapped,
  });
  
  final TabController tabController;
  final int selectedIndex;
  final Function(int) onTabTapped;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      controller: tabController,
      indicator: const UnderlineTabIndicator(borderRadius: BorderRadius.zero),
      onTap: onTabTapped,
      tabs: [
        _buildTab(0, 'Загальна статистика'),
        _buildTab(1, 'Виконані'),
        _buildTab(2, 'Не виконані'),
      ],
      labelStyle: AppFonts.semiboldDark20,
      labelPadding: EdgeInsets.zero,
    );
  }

  Widget _buildTab(int index, String title) {
    final isActive = selectedIndex == index;

    return Tab(
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? AppColors.appPurple : null,
          borderRadius: index == 0
              ? const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              : index == 1
                  ? BorderRadius.circular(20)
                  : const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontSize: index == 0 ? AppDimensions.xxxxs_ : AppDimensions.xxxs,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
