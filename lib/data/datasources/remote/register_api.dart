import 'package:ayur_care/core/config/api_constants.dart';
import 'package:ayur_care/core/config/config.dart';
import 'package:http/http.dart' as http;

class RegisterApi {
  final String baseUrl;
  final http.Client client;
  RegisterApi({required this.baseUrl, required this.client});

  Future<http.Response> getTreatments() async {
    final url = Uri.parse(treatmentListUrl);
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userData?.token}',
      },
    );
    return response;
  }

  Future<http.Response> getBranchs() async {
    final url = Uri.parse(branchListUrl);
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userData?.token}',
      },
    );
    return response;
  }

  Future<http.Response> registerPatient(Map<String, dynamic> request) async {
    final url = Uri.parse(registerPatientUrl);
    final response = await client.post(
      body: request,
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userData?.token}',
      },
    );
    return response;
  }
}
