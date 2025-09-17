import 'package:ayur_care/data/models/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(String email, String password);
}
