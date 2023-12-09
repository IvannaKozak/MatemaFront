import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';

import 'package:matemafront/pages/customize_account_page.dart';
import 'package:matemafront/widgets/logout_button_profile.dart';
import 'package:matemafront/widgets/profile_customization_button.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 0.05 * MediaQuery.of(context).size.height),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.appPurple,
                      width: 3,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: AppColors.appGreen,
                    radius: 100,
                  ),
                ),
                const SizedBox(height: 9),
                const Text(
                  'Я',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'ID: Моє',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                Button(
                  name: const Text('Редагування профілю'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCustomAcc()),
                    );
                  },
                ),
                const SizedBox(height: 15),
                const Divider(endIndent: BorderSide.strokeAlignCenter),
                const SizedBox(height: 15),
                LogOutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}