import 'package:flutter/material.dart';
import 'package:matemafront/utils/app_colors.dart';

class SwitchCircleWidget extends StatefulWidget {
  @override
  _SwitchCircleWidgetState createState() => _SwitchCircleWidgetState();
}

class _SwitchCircleWidgetState extends State<SwitchCircleWidget> {
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isCompleted = !_isCompleted;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: _isCompleted ? AppColors.appGreen : AppColors.white,
          border: Border.all(
            color: _isCompleted ? Colors.transparent : Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: _isCompleted
            ? const Icon(Icons.check, color: AppColors.appPurple)
            : Container(),
      ),
    );
  }
}
