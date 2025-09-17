import 'dart:convert';

import 'package:ayur_care/data/models/patient_list_response.dart';
import 'package:ayur_care/domain/repositories/patient_repository.dart';

import '../datasources/remote/patient_api.dart';

class PatientRepositoryImpl extends PatientRepository {
  final PatientApi patientApi;
  PatientRepositoryImpl({required this.patientApi});
  @override
  Future<PatientResponse> getPatients() async {
    final response = await patientApi.getPatients();
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return PatientResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to get patients list: ${response.statusCode}');
    }
  }
}
