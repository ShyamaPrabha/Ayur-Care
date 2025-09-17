
import 'package:ayur_care/data/models/treatment_list_response.dart';

abstract class RegisterRepository {
  Future<TreatmentResponse> getTreatments();
}