import 'package:ayur_care/core/extensions/margin_extensions.dart';
import 'package:ayur_care/presentation/screens/registration/invoice_page.dart';
import 'package:ayur_care/presentation/screens/widgets/common_app_bar.dart';
import 'package:ayur_care/presentation/screens/widgets/common_button.dart';
import 'package:ayur_care/presentation/screens/widgets/common_textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Register"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            30.hBox,
            CommonTextFieldWithLabel(
              mainLabel: 'Name',
              controller: TextEditingController(),
              label: 'Enter your full name',
              onChanged: (val) {},
            ),
            20.hBox,
            CommonTextFieldWithLabel(
              mainLabel: 'Whatsapp Number',
              controller: TextEditingController(),
              label: 'Enter your Whatsapp number',
              onChanged: (val) {},
            ),
            20.hBox,
            CommonTextFieldWithLabel(
              mainLabel: 'Address',
              controller: TextEditingController(),
              label: 'Enter your full address',
              onChanged: (val) {},
            ),
            20.hBox,
            CommonTextFieldWithLabel(
              mainLabel: 'Location',
              controller: TextEditingController(),
              label: 'Choose your location',
              onChanged: (val) {},
            ),
            20.hBox,
            CommonTextFieldWithLabel(
              mainLabel: 'Location',
              controller: TextEditingController(),
              label: 'Choose your location',
              onChanged: (val) {},
            ),
            20.hBox,
            CommonTextFieldWithLabel(
              mainLabel: 'Branch',
              controller: TextEditingController(),
              label: 'Select the branch',
              onChanged: (val) {},
            ),
            20.hBox,
            CommonButton(buttonText: 'Add Treatment'),
            20.hBox,
            CommonTextFieldWithLabel(
              mainLabel: 'Total Amount',
              controller: TextEditingController(),
              label: '',
              onChanged: (val) {},
            ),
            20.hBox,
            CommonTextFieldWithLabel(
              mainLabel: 'Discount Amount',
              controller: TextEditingController(),
              label: '',
              onChanged: (val) {},
            ),
            20.hBox,
            CommonTextFieldWithLabel(
              mainLabel: 'Advance Amount',
              controller: TextEditingController(),
              label: '',
              onChanged: (val) {},
            ),
            20.hBox,
            CommonTextFieldWithLabel(
              mainLabel: 'Balance Amount',
              controller: TextEditingController(),
              label: '',
              onChanged: (val) {},
            ),
            20.hBox,
        
            CommonButton(buttonText: 'Save',onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const InvoicePage();
              },));
            },),
          ],
        ),
      ),
    );
  }
}
