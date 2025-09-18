import 'package:ayur_care/data/models/branch_list_response.dart';
import 'package:ayur_care/data/models/requests/patient_register_request.dart';
import 'package:ayur_care/domain/usecases/register_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show showDatePicker;
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../data/models/treatment_list_response.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterUseCase useCase;
  RegisterProvider({required this.useCase});
  bool isLoading = false;
  List<Treatment> treatments = [];
  List<Branch> branches = [];
  Branch? selectedBranch;
  String? selectedLocation;
  Treatment? selectedTreatment;
  String? selectedPaymentMethod;
  String? selectedHour;
  String? selectedMinute;
  List<String> hours = List.generate(
    12,
    (i) => (i + 1).toString().padLeft(2, "0"),
  );
  List<String> minutes = List.generate(
    60,
    (i) => (i + 1).toString().padLeft(2, "0"),
  );
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController discountAmountController =
      TextEditingController();
  final TextEditingController advanceAmountController = TextEditingController();
  final TextEditingController balanceAmountController = TextEditingController();
  DateTime? selectedDate;
  String? selectedDateString;
  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      selectedDateString = DateFormat('dd-MM-yyyy').format(selectedDate!);
      notifyListeners();
    }
  }

  Future<void> fetchTreatments() async {
    try {
      isLoading = true;
      notifyListeners();
      final result = await useCase.getTreatments();
      if (result.status!) {
        treatments = result.treatments ?? [];
      } else {
        treatments = [];
      }
    } catch (e) {
      treatments = [];
      if (kDebugMode) {
        print('Error fetching treatments : $e');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getBranches() async {
    try {
      isLoading = true;
      notifyListeners();
      final result = await useCase.getBranches();
      if (result.status!) {
        branches = result.branches ?? [];
      } else {
        branches = [];
      }
    } catch (e) {
      branches = [];
      if (kDebugMode) {
        print('Error fetching branches  $e');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> registerPatient() async {
    try {
      isLoading = true;
      notifyListeners();
      final request = PatientRegisterRequest(
        name: nameController.text,
        excecutive: '',
        payment: '',
        phone: numberController.text,
        address: addressController.text,
        total_amount: double.parse(totalAmountController.text),
        discount_amount: double.parse(discountAmountController.text),
        advance_amount: double.parse(advanceAmountController.text),
        balance_amount: double.parse(balanceAmountController.text),
        date_nd_time: '',
        id: '',
        male: [],
        female: [],
        branch: '',
        treatments: [],
      );
      final result = await useCase.registerPatient(request);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching branches  $e');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
