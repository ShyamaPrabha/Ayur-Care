import 'package:ayur_care/data/models/login_response.dart';
import 'package:ayur_care/domain/usecases/auth_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/config/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final AuthUseCase authUseCase;
  AuthProvider({required this.authUseCase});
  bool isLoading = false;
  LoginResponse? loginResponse;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
  void setEmail(String email) {
    emailController.text = email;
    notifyListeners();
  }
  void setPassword(String password) {
    passwordController.text = password;
    notifyListeners();
  }
  Future<void> login() async {
    try {
      isLoading = true;
      notifyListeners();
      final result = await authUseCase.login(
        emailController.text,
        passwordController.text,
      );
      if (result.status) {
        loginResponse = result;
        await SharedPref().save(key: "userdata", value: loginResponse);
        await SharedPref().getUserData();
        emailController.clear();
        passwordController.clear();
      } else {
        loginResponse = null;
      }
    } catch (e) {
      loginResponse = null;
      if (kDebugMode) {
        print('Login error: $e');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
