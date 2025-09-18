import 'package:ayur_care/core/constants/app_colors.dart';
import 'package:ayur_care/core/constants/app_strings.dart';
import 'package:ayur_care/core/constants/app_textstyles.dart';
import 'package:ayur_care/core/extensions/margin_extensions.dart';
import 'package:ayur_care/core/utils/date_utils.dart';
import 'package:ayur_care/presentation/provider/dashboard/dashboard_provider.dart';
import 'package:ayur_care/presentation/screens/registration/register_screen.dart';
import 'package:ayur_care/presentation/screens/widgets/common_app_bar.dart';
import 'package:ayur_care/presentation/screens/widgets/common_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientListingScreen extends StatefulWidget {
  const PatientListingScreen({super.key});

  @override
  State<PatientListingScreen> createState() => _PatientListingScreenState();
}

class _PatientListingScreenState extends State<PatientListingScreen> {
  late DashboardProvider dashboardProvider;
  @override
  void initState() {
    dashboardProvider = context.read<DashboardProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dashboardProvider.fetchPatients();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = context.watch<DashboardProvider>();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CommonButton(
            buttonText: AppStrings.registerNow,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const RegisterScreen();
                  },
                ),
              );
            },
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: CommonAppBar(homeScreen: true),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await dashboardProvider.fetchPatients();
              },
              child: Builder(
                builder: (context) {
                  if (dashboardProvider.isLoading) {
                    return Center(child: CupertinoActivityIndicator());
                  } else if (dashboardProvider.patients.isEmpty) {
                    return Center(
                      child: Text(
                        'No Patients Found',
                        style: AppTextStyles.textStyle_500_12,
                      ),
                    );
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemBuilder: (context, index) {
                      var item = dashboardProvider.patients[index];
                      return PatientListCard(
                        no: '${index + 1}'.padLeft(2, '0'),
                        name: item.name ?? '',
                        packageName:
                            item.patientdetailsSet?[0].treatmentName ?? '',
                        date: formatDateForPatients(item.dateNdTime ?? ''),
                        byStanderName: item.user ?? '',
                      );
                    },
                    separatorBuilder: (context, index) => 24.hBox,
                    itemCount: dashboardProvider.patients.length,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PatientListCard extends StatelessWidget {
  final String no;
  final String name;
  final String packageName;
  final String date;
  final String byStanderName;
  const PatientListCard({
    super.key,
    required this.no,
    required this.name,
    required this.packageName,
    required this.date,
    required this.byStanderName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                23.hBox,
                Text(
                  '$no. $name',
                  style: AppTextStyles.textStyle_500_12.copyWith(fontSize: 18),
                ),
                3.hBox,
                Text(
                  packageName,
                  style: AppTextStyles.textStyle_300_14.copyWith(
                    fontSize: 16,
                    color: AppColors.buttonColor,
                  ),
                ),
                14.hBox,
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                          color: AppColors.iconColor,
                        ),
                        6.wBox,
                        Text(
                          date,
                          style: AppTextStyles.textStyle_400_16.copyWith(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.50),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.people_outline,
                          size: 16,
                          color: AppColors.iconColor,
                        ),
                        6.wBox,
                        Text(
                          byStanderName,
                          style: AppTextStyles.textStyle_400_16.copyWith(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.50),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          10.hBox,
          Divider(color: Colors.black.withOpacity(0.20), thickness: 1),
          9.hBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.viewBookingDetails,
                  style: AppTextStyles.textStyle_300_14.copyWith(fontSize: 16),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: AppColors.buttonDisabledColor,
                ),
              ],
            ),
          ),
          9.hBox,
        ],
      ),
    );
  }
}
