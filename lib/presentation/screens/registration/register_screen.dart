import 'package:ayur_care/core/constants/app_colors.dart';
import 'package:ayur_care/core/constants/app_textstyles.dart';
import 'package:ayur_care/core/extensions/margin_extensions.dart';
import 'package:ayur_care/data/models/branch_list_response.dart';
import 'package:ayur_care/presentation/provider/registration/register_provider.dart';
import 'package:ayur_care/presentation/screens/registration/invoice_page.dart';
import 'package:ayur_care/presentation/screens/registration/treatment_add_dialogue.dart';
import 'package:ayur_care/presentation/screens/widgets/common_app_bar.dart';
import 'package:ayur_care/presentation/screens/widgets/common_button.dart';
import 'package:ayur_care/presentation/screens/widgets/common_dropdown.dart';
import 'package:ayur_care/presentation/screens/widgets/common_radio_button.dart';
import 'package:ayur_care/presentation/screens/widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerProvider = context.watch<RegisterProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(title: "Register"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              // CommonTextFieldWithLabel(
              //   mainLabel: 'Location',
              //   controller: TextEditingController(),
              //   label: 'Choose your location',
              //   onChanged: (val) {},
              // ),
              //  20.hBox,
              CommonDropDownWithLabel<String>(
                value: 'A',
                items: ["A", "B"],
                onChanged: (val) {},
                label: 'Choose your location',
                mainLabel: 'Location',
                getLabel: (p0) => p0,
              ),
              // CommonTextFieldWithLabel(
              //   mainLabel: 'Location',
              //   controller: TextEditingController(),
              //   label: 'Choose your location',
              //   onChanged: (val) {},
              // ),
              20.hBox,
              CommonDropDownWithLabel<Branch>(
                value: registerProvider.selectedBranch,
                items: registerProvider.branches,
                onChanged: (val) {},
                label: 'Select the branch',
                mainLabel: 'Branch',
                getLabel: (p0) => p0.name ?? "",
              ),

              20.hBox,
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = registerProvider.treatmentsAddedList[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.53),
                      color: AppColors.cardFillColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${index + 1}. ${item.treatmentName}',
                                style: AppTextStyles.textStyle_500_12.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  registerProvider.updateTreatments(
                                    isRemove: true,
                                    index: index,
                                  );
                                },
                                icon: Icon(Icons.close, color: Colors.red),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Male',
                                    style: AppTextStyles.textStyle_400_16
                                        .copyWith(color: AppColors.buttonColor),
                                  ),
                                   10.wBox,
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Colors.black.withOpacity(0.20),
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                                      child: Text(
                                        item.malePatientCount,
                                        style: AppTextStyles.textStyle_400_16
                                            .copyWith(color: AppColors.buttonColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Female',
                                    style: AppTextStyles.textStyle_400_16
                                        .copyWith(color: AppColors.buttonColor),
                                  ),
                                  10.wBox,
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Colors.black.withOpacity(0.20),
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0,
                                        vertical: 5.0,
                                      ),
                                      child: Text(
                                        item.femalePatientCount,
                                        style: AppTextStyles.textStyle_400_16
                                            .copyWith(color: AppColors.buttonColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => 10.hBox,
                itemCount: registerProvider.treatmentsAddedList.length,
              ),
              10.hBox,
              CommonButton(
                buttonText: 'Add Treatment',
                onTap: () async {
                  await registerProvider.fetchTreatments();
                  treatmentAddDialogue(
                    onSave: () {
                      registerProvider.updateTreatments();
                      Navigator.pop(context);
                    },
                    onMaleIncrement: () =>
                        registerProvider.changeMaleNo(isIncrement: true),
                    onMaleDecrement: () => registerProvider.changeMaleNo(),
                    onFemaleIncrement: () =>
                        registerProvider.changeFemaleNo(isIncrement: true),
                    onFemaleDecrement: () => registerProvider.changeFemaleNo(),
                    context: context,
                    value: registerProvider.selectedTreatment,
                    treatmentsList: registerProvider.treatments,
                    onChanged: (val) {
                      registerProvider.selectedTreatment = val;
                    },
                    femaleNoController: registerProvider.femaleNoController,
                    maleNoController: registerProvider.maleNoController,
                  );
                },
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonRadioButton(
                    selectedValue: registerProvider.selectedPaymentMethod,
                    onChanged: (val) {
                      registerProvider.setPaymentMethod(val!);
                    },
                    value: "Cash",
                  ),
                  CommonRadioButton(
                    selectedValue: registerProvider.selectedPaymentMethod,
                    onChanged: (val) {
                      registerProvider.setPaymentMethod(val!);
                    },
                    value: "Card",
                  ),
                  CommonRadioButton(
                    selectedValue: registerProvider.selectedPaymentMethod,
                    onChanged: (val) {
                      registerProvider.setPaymentMethod(val!);
                    },
                    value: "UPI",
                  ),
                ],
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
              Text('Treatment Date', style: AppTextStyles.textStyle_400_16),
              6.hBox,
              Container(
                decoration: BoxDecoration(
                  color: AppColors.textfilledColor,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.10),
                    width: 0.85,
                  ),
                  borderRadius: BorderRadius.circular(8.53),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    //   vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          registerProvider.selectedDateString != null
                              ? registerProvider.selectedDateString!
                              : '',
                        ),
                      ),
                      IconButton(
                        onPressed: () => registerProvider.pickDate(context),
                        icon: Icon(
                          Icons.calendar_today_outlined,
                          color: AppColors.buttonColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.hBox,
              Text('Treatment Time', style: AppTextStyles.textStyle_400_16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CommonDropdown<String>(
                      value: registerProvider.selectedHour,
                      items: registerProvider.hours,
                      onChanged: (val) {
                        registerProvider.selectedHour = val;
                      },
                      label: 'Hour',
                      getLabel: (p0) => p0,
                    ),
                  ),
                  10.wBox,
                  Expanded(
                    child: CommonDropdown<String>(
                      value: registerProvider.selectedMinute,
                      items: registerProvider.minutes,
                      onChanged: (val) {
                        registerProvider.selectedMinute = val;
                      },
                      label: 'Minutes',
                      getLabel: (p0) => p0,
                    ),
                  ),
                ],
              ),
              55.hBox,
              CommonButton(
                buttonText: 'Save',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return InvoicePage(
                          adress: registerProvider.addressController.text,
                          advanceAmount:
                              registerProvider.advanceAmountController.text,
                          balanceAmount:
                              registerProvider.balanceAmountController.text,
                          bookedOn: registerProvider.selectedDateString ?? '',
                          discountAmount:
                              registerProvider.discountAmountController.text,
                          patientName: registerProvider.nameController.text,
                          phoneNo: registerProvider.numberController.text,
                          totalAmount:
                              registerProvider.totalAmountController.text,
                          treatmentDate:
                              registerProvider.selectedDateString ?? '',
                          treatmentTime: registerProvider.selectedHour ?? '',
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
