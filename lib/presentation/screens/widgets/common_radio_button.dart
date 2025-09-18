import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_textstyles.dart';

class CommonRadioButton extends StatelessWidget {
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String value;
  const CommonRadioButton({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: selectedValue,
          onChanged: onChanged,
          activeColor: AppColors.textBlack,
        ),
        Text(
          value,
          style: AppTextStyles.textStyle_300_14.copyWith(
            color: AppColors.textBlack,
          ),
        ),
      ],
    );
  }
}
