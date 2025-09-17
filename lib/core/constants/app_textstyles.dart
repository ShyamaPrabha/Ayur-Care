import 'package:ayur_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();
  static TextStyle textStyle_600_24 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textBlack,
  );
  static TextStyle textStyle_300_14 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: Colors.black.withOpacity(0.40),
  );
  static TextStyle textStyle_400_16 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
  );
  static TextStyle textStyle_600_17 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle textStyle_500_12 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}
