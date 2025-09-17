import 'dart:convert';

import 'package:ayur_care/data/datasources/remote/register_api.dart';
import 'package:ayur_care/data/models/treatment_list_response.dart';
import 'package:ayur_care/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterApi registerApi;
  RegisterRepositoryImpl({required this.registerApi});
  @override
  Future<TreatmentResponse> getTreatments() async {
    final response = await registerApi.getTreatments();
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return TreatmentResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load treatment centers');
    }
  }
}
