import 'package:ayur_care/data/models/branch_list_response.dart';
import 'package:ayur_care/data/models/requests/patient_register_request.dart';
import 'package:ayur_care/domain/usecases/register_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../../data/models/treatment_list_response.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterUseCase useCase;
  RegisterProvider({required this.useCase});
  bool isLoading = false;
  List<Treatment> treatments = [];
  List<Branch> branches = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController discountAmountController =
      TextEditingController();
  final TextEditingController advanceAmountController = TextEditingController();
  final TextEditingController balanceAmountController = TextEditingController();

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
