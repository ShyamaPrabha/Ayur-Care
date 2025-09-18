import 'dart:ui';

import 'package:ayur_care/core/constants/app_colors.dart';
import 'package:ayur_care/core/constants/app_textstyles.dart';
import 'package:ayur_care/core/extensions/margin_extensions.dart';
import 'package:ayur_care/data/models/treatment_list_response.dart';
import 'package:ayur_care/presentation/screens/widgets/common_button.dart';
import 'package:ayur_care/presentation/screens/widgets/common_dropdown.dart';
import 'package:ayur_care/presentation/screens/widgets/common_textfield.dart';
import 'package:flutter/material.dart';

void treatmentAddDialogue({
  required BuildContext context,
  required Treatment? value,
  required List<Treatment> treatmentsList,
  required void Function(Treatment?) onChanged,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.2),
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonDropDownWithLabel<Treatment>(
                value: value,
                items: treatmentsList,
                onChanged: onChanged,
                label: 'Choose prefered treatment',
                mainLabel: 'Choose Treatment',
                getLabel: (p0) => p0.name ?? '',
              ),
              20.hBox,
              Text('Add Patients', style: AppTextStyles.textStyle_400_16),
              5.hBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.53),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.25),
                          width: 0.85,
                        ),
                        color: AppColors.textfilledColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Male',
                          style: AppTextStyles.textStyle_300_14.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        removeAddIcon(isRemove: true),
                        2.wBox,
                        Expanded(
                          child: CommonTextfield(
                            controller: TextEditingController(),
                            label: '',
                            onChanged: (val) {},
                          ),
                        ),
                        2.wBox,
                        removeAddIcon(),
                      ],
                    ),
                  ),
                ],
              ),
              22.hBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.53),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.25),
                          width: 0.85,
                        ),
                        color: AppColors.textfilledColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Female',
                          style: AppTextStyles.textStyle_300_14.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        removeAddIcon(isRemove: true),
                        2.wBox,
                        Expanded(
                          child: CommonTextfield(
                            controller: TextEditingController(),
                            label: '',
                            onChanged: (val) {},
                          ),
                        ),
                        2.wBox,
                        removeAddIcon(),
                      ],
                    ),
                  ),
                ],
              ),
              30.hBox,
              CommonButton(buttonText: 'Save'),
            ],
          ),
        ),
      );
    },
  );
}

Widget removeAddIcon({bool isRemove = false}) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.buttonColor,
    ),
    child: Icon(isRemove ? Icons.remove : Icons.add, color: Colors.white),
  );
}
