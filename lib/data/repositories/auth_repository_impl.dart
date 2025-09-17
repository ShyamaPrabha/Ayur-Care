import 'dart:convert';

import 'package:ayur_care/data/models/login_response.dart';
import 'package:ayur_care/domain/repositories/auth_repository.dart';

import '../datasources/remote/auth_api.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApi authApi;
  AuthRepositoryImpl({required this.authApi});
  @override
  Future<LoginResponse> login(String email, String password) async {
    final response = await authApi.login(email, password);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return LoginResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }
}
