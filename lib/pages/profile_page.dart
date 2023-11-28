import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';
import 'package:matemafront/pages/customize_accaount_page.dart';

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
                  child: CircleAvatar(
                    backgroundColor: AppColors.appGreen,
                    radius: 100,
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  'Я',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'ID: Моє',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 25),
                Button(
                  name: Text('Редагування профілю'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCustomAcc()),
                    );
                  },
                ),
                SizedBox(height: 15),
                Button(
                  name: Text('Редагування профілю'),
                  onPressed: () {},
                ),
                SizedBox(height: 15),
                Button(
                  name: Text('Редагування профілю'),
                  onPressed: () {},
                ),
                SizedBox(height: 15),
                LogOutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final Widget name;
  final VoidCallback? onPressed;

  const Button({
    Key? key,
    required this.name,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: AppDimensions.xxs),
      width: MediaQuery.of(context).size.width * 0.91,
      height: 75,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: AppDimensions.xl,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: AppDimensions.xxxxs),
                    SvgPicture.asset(
                  'assets/images/user_circle.svg',
                  height: 30,
                  width: 30,
                ),
                    const SizedBox(width: AppDimensions.xxxxs),
                    DefaultTextStyle(
                      style: AppFonts.semiboldDark24,
                      child: name,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: AppDimensions.xxs),
      width: MediaQuery.of(context).size.width * 0.91,
      height: 75,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: AppDimensions.xl,
              decoration: BoxDecoration(
                color: AppColors.appGreen,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: AppDimensions.xxxxs),
                  SvgPicture.asset(
                  'assets/images/signout.svg',
                  height: 30,
                  width: 30,
                ),
                  const SizedBox(width: AppDimensions.xxxxs),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Вийти з акаунту',
                          style: AppFonts.semiboldDark24,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
