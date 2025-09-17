import 'package:ayur_care/core/constants/app_colors.dart';
import 'package:ayur_care/core/constants/app_textstyles.dart';
import 'package:ayur_care/core/extensions/margin_extensions.dart';
import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? togglePasswordVisibility;
  final Function(String)? onChanged;
  final TextInputAction inputAction;
  final bool isSearch;
  final String? hintText;
  final TextStyle? hintStyle;
  const CommonTextfield({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.togglePasswordVisibility,
    this.isPasswordVisible = false,
    required this.onChanged,
    this.inputAction = TextInputAction.next,
    this.isSearch = false,
    this.hintText,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword && !isPasswordVisible,
      onChanged: onChanged,
      textInputAction: inputAction,
      style: AppTextStyles.textStyle_300_14.copyWith(
        color: AppColors.textBlack,
      ),
      decoration: InputDecoration(
        labelText: isSearch ? null : label,
        hintText: isSearch ? hintText ?? 'Search...' : null,
        hintStyle: hintStyle ?? AppTextStyles.textStyle_300_14,
        labelStyle: hintStyle ?? AppTextStyles.textStyle_300_14,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        fillColor: AppColors.textfilledColor,
        filled: true,
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(isFocused: true),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.textBlack,
                ),
                onPressed: togglePasswordVisibility,
              )
            : null,
      ),
    );
  }

  InputBorder _buildBorder({bool isFocused = false}) {
    final color = isFocused
        ? AppColors.textBlack
        : Colors.black.withOpacity(0.10);

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.53),
      borderSide: BorderSide(color: color, width: 0.85),
      gapPadding: 0,
    );
  }
}

class CommonTextFieldWithLabel extends StatelessWidget {
  final String mainLabel;
  final TextEditingController? controller;
  final String label;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? togglePasswordVisibility;
  final Function(String)? onChanged;
  final TextInputAction inputAction;
  final bool isSearch;
  final String? hintText;
  final TextStyle? hintStyle;
  const CommonTextFieldWithLabel({
    super.key,
    required this.mainLabel,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.togglePasswordVisibility,
    this.isPasswordVisible = false,
    required this.onChanged,
    this.inputAction = TextInputAction.next,
    this.isSearch = false,
    this.hintText,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(mainLabel, style: AppTextStyles.textStyle_400_16),
        6.hBox,
        CommonTextfield(
          controller: controller,
          label: label,
          onChanged: onChanged,
          hintStyle: hintStyle,
          hintText: hintText,
          inputAction: inputAction,
          isPassword: isPassword,
          isPasswordVisible: isPasswordVisible,
          isSearch: isSearch,
          togglePasswordVisibility: togglePasswordVisibility,
        ),
      ],
    );
  }
}
