import 'package:ayur_care/core/constants/app_colors.dart';
import 'package:ayur_care/core/constants/app_textstyles.dart';
import 'package:ayur_care/core/extensions/margin_extensions.dart';
import 'package:ayur_care/presentation/screens/widgets/common_button.dart';
import 'package:ayur_care/presentation/screens/widgets/common_textfield.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool homeScreen;
  final String title;
  const CommonAppBar({super.key, this.homeScreen = false, this.title = ''});

  @override
  Widget build(BuildContext context) {
    final sortOptions = ['Date', 'Name', 'Package'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        50.hBox,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back, color: AppColors.backIconColor, size: 20)),
              Icon(
                Icons.notifications_active_outlined,
                color: AppColors.backIconColor,
                size: 20,
              ),
            ],
          ),
        ),
        15.hBox,
        if (homeScreen)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: CommonTextfield(
                          controller: TextEditingController(),
                          label: 'Search for treatments',
                          onChanged: (val) {},
                          isSearch: true,
                        ),
                      ),
                    ),
                    15.wBox,
                    Expanded(child: CommonButton(buttonText: 'Search')),
                  ],
                ),
                20.hBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Sort by :',
                        style: AppTextStyles.textStyle_500_12.copyWith(
                          fontSize: 16,
                          color: AppColors.textBlack,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 39,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: DropdownButton<String>(
                          style: AppTextStyles.textStyle_400_16.copyWith(
                            fontSize: 15,
                          ),
                          value: 'Date',
                          underline:
                              const SizedBox(), // removes default underline
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.green,
                          ),
                          items: sortOptions.map((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            // setState(() {
                            //   selectedValue = newValue!;
                            // });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        if (!homeScreen) Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(title, style: AppTextStyles.textStyle_600_24),
        ),
        12.hBox,
        Divider(color: Colors.black.withOpacity(0.20), thickness: 1),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight( homeScreen ?  230 : 152);
}
