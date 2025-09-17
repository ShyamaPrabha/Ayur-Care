import 'package:ayur_care/data/models/branch_list_response.dart';
import 'package:ayur_care/domain/usecases/register_use_case.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/treatment_list_response.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterUseCase useCase;
  RegisterProvider({required this.useCase});
  bool isLoading = false;
  List<Treatment> treatments = [];
  List<Branch> branches = [];

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
}
