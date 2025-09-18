import 'package:ayur_care/core/constants/app_colors.dart';
import 'package:ayur_care/core/constants/app_textstyles.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final bool isEnabled;
  final String buttonText;
  final VoidCallback? onTap;
  final double height;
  final double width;
  final bool isLoading;
  const CommonButton({
    super.key,
    this.isEnabled = true,
    required this.buttonText,
    this.onTap,
    this.height = 50,
    this.width = double.infinity,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.52),
          color: isEnabled
              ? AppColors.buttonColor
              : AppColors.buttonDisabledColor.withOpacity(0.3),
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
          child: isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(buttonText, style: AppTextStyles.textStyle_600_17),
        ),
      ),
    );
  }
}
