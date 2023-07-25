import 'package:bowindo_trial/models/user.dart';
import 'package:flutter/material.dart';

import '../services/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  final _authRepository = AuthRepository();
  bool isLoading = false;

  User? user;
  String? token;
  String? refresh;

  Future<bool?> login(String userId, String password) async {
    var data = await _authRepository.login(userId, password);
    user = data?.user;
    token = data?.token;
    refresh = data?.refresh;
    notifyListeners();
    return true;
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
