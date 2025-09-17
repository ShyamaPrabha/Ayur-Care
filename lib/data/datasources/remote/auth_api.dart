import 'package:ayur_care/core/config/api_constants.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  final String baseUrl;
  final http.Client client;
  AuthApi({required this.baseUrl, required this.client});

  Future<http.Response> login(String email, String password) async {
    final url = Uri.parse(loginUrl);
    final request = http.MultipartRequest('POST', url);
    request.fields['username'] = email;
    request.fields['password'] = password;
    final streamedResponse = await request.send();
    return await http.Response.fromStream(streamedResponse);
  }
}
