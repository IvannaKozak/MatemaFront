import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class LogOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: AppColors.lightBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(width: 5, color: AppColors.appGreen)),
              title: const Text('Вихід з акаунту', style: AppFonts.boldDark26),
              content: const Text(
                'Ви впевнені, що хочете вийти з акаунту?',
                style: AppFonts.semiboldDark15,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Скасувати',
                    style: AppFonts.semiboldDark15,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Підтвердити',
                    style: AppFonts.semibold15(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
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
                decoration: const BoxDecoration(
                  color: Colors.red,
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
                    const Expanded(
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
      ),
    );
  }
}
