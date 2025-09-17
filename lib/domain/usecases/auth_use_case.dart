import 'package:ayur_care/data/models/login_response.dart';
import 'package:ayur_care/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository repository;
  AuthUseCase({required this.repository});

  Future<LoginResponse> login(String email, String password) {
    return repository.login(email, password);
  }
}
