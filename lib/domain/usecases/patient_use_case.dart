import 'package:ayur_care/domain/repositories/patient_repository.dart';

import '../../data/models/patient_list_response.dart';

class PatientUseCase {
  final PatientRepository repository;
  PatientUseCase({required this.repository});

  Future<PatientResponse> getPatients() async {
    return await repository.getPatients();
  }
}
