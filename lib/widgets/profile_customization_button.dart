import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.name,
    required this.svgPath,
    this.onPressed,
  }) : super(key: key);

  final Widget name;
  final String svgPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: AppDimensions.xxs),
      // width: MediaQuery.of(context).size.width * 0.91,
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
                decoration: const BoxDecoration(
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
                      svgPath,
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(width: AppDimensions.xxxxs),
                    DefaultTextStyle(
                      style: AppFonts.semiboldDark24,
                      child: name,
                    ),
                    const Spacer(),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: SvgPicture.asset(
                        'assets/images/expand_right.svg',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 5,)
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
