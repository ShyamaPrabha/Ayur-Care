
import 'package:ayur_care/data/models/patient_list_response.dart';

abstract class PatientRepository {
  Future<PatientResponse> getPatients();
}