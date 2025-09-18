import 'package:ayur_care/core/config/config.dart';
import 'package:http/http.dart' as http;

import '../../../core/config/api_constants.dart';

class PatientApi {
  final String baseUrl;
  final http.Client client;
  PatientApi({required this.baseUrl, required this.client});

  Future<http.Response> getPatients() async {
    final url = Uri.parse(patientListUrl);
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userData?.token}',
      },
    );
    return response;
  }
}
