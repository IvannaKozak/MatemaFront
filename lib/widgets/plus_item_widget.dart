import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlusItemButton extends StatelessWidget {
  // Callback for button press

  const PlusItemButton({Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            // side: BorderSide(color: Colors.grey[300]!),
          ),
        ),
        child: SvgPicture.asset('assets/images/icon_plus.svg',
            width: AppDimensions.xxxm,
            colorFilter: const ColorFilter.mode(AppColors.black,
                BlendMode.srcIn) // You can adjust the size as needed
            ),
      ),
    );
    // IconButton(
    //   iconSize: 65.0, // Set the size of the IconButton
    //   onPressed: onPressed, // Use the onPressed callback here
    //   icon: SvgPicture.asset('assets/images/icon_plus.svg',
    //       width: AppDimensions.xxxm,
    //       colorFilter: const ColorFilter.mode(AppColors.white,
    //           BlendMode.srcIn) // You can adjust the size as needed
    //       ),
    //   // Adjust the padding and other styles as needed
    // );
  }
}
