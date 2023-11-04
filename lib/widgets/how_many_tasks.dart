import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

class TasksSlider extends StatefulWidget {
  @override
  TasksSliderState createState() => TasksSliderState();
}

class TasksSliderState extends State<TasksSlider> {
  double _currentValue = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: AppDimensions.xxs,
          ),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              color: AppColors.appGreen,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              border: Border.all(
                color: AppColors.appPurple,
                width: 2.0,
              )),
          height: AppDimensions.s,
          child: Slider(
            value: _currentValue,
            onChanged: (double value) {
              setState(() {
                _currentValue = value;
              });
            },
            divisions: 7,
            min: 1,
            max: 8,
            thumbColor: AppColors.appPurple,
            activeColor: AppColors.appGreen,
            inactiveColor: AppColors.appGreen,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 50.0, top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                8,
                (index) => Text(
                      '${index + 1}',
                      style: AppFonts.semiboldDark16,
                    )),
          ),
        ),
      ],
    );
  }
}



// class HowManyTasksWidget extends StatelessWidget {
//   const HowManyTasksWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(right: AppDimensions.xxs),
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               height: AppDimensions.s,
//               decoration: const BoxDecoration(
//                 color: AppColors.appGreen,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   const SizedBox(width: AppDimensions.xxxxs),
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'O',
//                           style: AppFonts.boldDark26,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
