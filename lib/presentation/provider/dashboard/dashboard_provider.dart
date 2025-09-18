import 'package:ayur_care/data/models/patient_list_response.dart';
import 'package:ayur_care/domain/usecases/patient_use_case.dart';
import 'package:flutter/foundation.dart';

class DashboardProvider extends ChangeNotifier {
  final PatientUseCase useCase;
  DashboardProvider({required this.useCase});

   bool isLoading = false;
   List<Patient> patients = [];
  PatientResponse? patientResponse;

  Future<void> fetchPatients() async {
    try {
      isLoading = true;
      notifyListeners();
      final result = await useCase.getPatients();
      if(result.status!){
          patients = result?.patient ?? [];
      }else{
        patients = [];
      }
    } catch (e) {
      patients = [];
      if (kDebugMode) {
        print('Error fetching patients: $e');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
