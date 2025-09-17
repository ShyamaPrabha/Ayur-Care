import 'package:ayur_care/domain/usecases/register_use_case.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/treatment_list_response.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterUseCase useCase;
  RegisterProvider({required this.useCase});
  bool isLoading = false;
  List<Treatment> treatments = [];

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
        print('Error fetching treatment centers: $e');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
