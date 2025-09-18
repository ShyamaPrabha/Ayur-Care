import 'package:ayur_care/core/extensions/margin_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_textstyles.dart';

class CommonDropdown<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String label;
  final String? hintText;
  final TextStyle? hintStyle;
  final ValueChanged<T?> onChanged;
  final bool isSearch;
   final String Function(T) getLabel; // 👈 Add this

  const CommonDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.label,
    this.hintText,
    this.hintStyle,
    this.isSearch = false,
    required this.getLabel
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      value: value,
      onChanged: onChanged,
      style: AppTextStyles.textStyle_300_14.copyWith(
        color: AppColors.textBlack,
      ),
      icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
      decoration: InputDecoration(
        labelText: isSearch ? null : label,
        hintText: isSearch ? hintText ?? 'Select...' : null,
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
      ),
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            overflow: TextOverflow.ellipsis,
            getLabel(item),
            style: AppTextStyles.textStyle_300_14.copyWith(
              color: AppColors.textBlack,
            ),
          ),
        );
      }).toList(),
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

class CommonDropDownWithLabel<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String label;
  final String? hintText;
  final TextStyle? hintStyle;
  final ValueChanged<T?> onChanged;
  final bool isSearch;
  final String mainLabel;
   final String Function(T) getLabel; // 👈 Add this
  const CommonDropDownWithLabel({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.label,
    this.hintText,
    this.hintStyle,
    this.isSearch = false,
    required this.mainLabel,
    required this.getLabel
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(mainLabel, style: AppTextStyles.textStyle_400_16),
        6.hBox,
        CommonDropdown(
          value: value,
          items: items,
          onChanged: onChanged,
          label: label,
          getLabel: getLabel,
        ),
      ],
    );
  }
}
