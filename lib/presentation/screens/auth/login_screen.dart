import 'package:ayur_care/core/constants/app_colors.dart';
import 'package:ayur_care/core/constants/app_textstyles.dart';
import 'package:ayur_care/core/constants/app_strings.dart';
import 'package:ayur_care/core/extensions/margin_extensions.dart';
import 'package:ayur_care/presentation/provider/auth/auth_provider.dart';
import 'package:ayur_care/presentation/screens/widgets/app_svg.dart';
import 'package:ayur_care/presentation/screens/widgets/common_button.dart';
import 'package:ayur_care/presentation/screens/widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AppStrings.splashBg,
                height: 150,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              AppSvg(assetName: AppStrings.ayurCareLogo, width: 80, height: 80),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.loginDesc,
                    style: AppTextStyles.textStyle_600_24,
                  ),
                  30.hBox,
                  CommonTextFieldWithLabel(
                    mainLabel: AppStrings.email,
                    controller: authProvider.emailController,
                    label: AppStrings.enterEmail,
                    onChanged: (val) {},
                  ),
                  25.hBox,
                  CommonTextFieldWithLabel(
                    mainLabel: AppStrings.password,
                    isPasswordVisible: authProvider.isPasswordVisible,
                    isPassword: true,
                    controller: authProvider.passwordController,
                    label: AppStrings.enterPassword,
                    togglePasswordVisibility:
                        authProvider.togglePasswordVisibility,
                    onChanged: (val) {},
                  ),
                  Spacer(),
                  CommonButton(buttonText: AppStrings.login),
                  Spacer(),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.loginDes2,
                          style: AppTextStyles.textStyle_300_14.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.termsAndConditions,
                          style: AppTextStyles.textStyle_500_12.copyWith(
                            color: AppColors.textBlue,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.and,
                          style: AppTextStyles.textStyle_300_14.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.privacyPolicy,
                          style: AppTextStyles.textStyle_500_12.copyWith(
                            color: AppColors.textBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
