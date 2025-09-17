import 'package:ayur_care/core/constants/app_colors.dart';
import 'package:ayur_care/core/constants/app_textstyles.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final bool isEnabled;
  final String buttonText;
  const CommonButton({
    super.key,
    this.isEnabled = true,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.52),
        color: isEnabled
            ? AppColors.buttonColor
            : AppColors.buttonDisabledColor,
        boxShadow: !isEnabled
            ? [
                BoxShadow(
                  color: AppColors.buttonColor.withOpacity(0.2),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: const Offset(2, 2),
                ),
              ]
            : [],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(buttonText, style: AppTextStyles.textStyle_600_17),
      ),
    );
  }
}
