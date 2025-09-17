import 'package:ayur_care/data/models/requests/patient_register_request.dart';
import 'package:ayur_care/data/models/treatment_list_response.dart';

import '../../data/models/branch_list_response.dart';

abstract class RegisterRepository {
  Future<TreatmentResponse> getTreatments();
  Future<BranchResponse> getBranches();
  Future<void> registerPatient(PatientRegisterRequest request);
}
