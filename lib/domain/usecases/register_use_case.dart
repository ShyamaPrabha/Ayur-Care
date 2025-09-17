import 'package:ayur_care/data/models/branch_list_response.dart';
import 'package:ayur_care/data/models/treatment_list_response.dart';
import 'package:ayur_care/domain/repositories/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository repository;
  RegisterUseCase({required this.repository});

  Future<TreatmentResponse> getTreatments() {
    return repository.getTreatments();
  }

  Future<BranchResponse> getBranches() {
    return repository.getBranches();
  }
}
