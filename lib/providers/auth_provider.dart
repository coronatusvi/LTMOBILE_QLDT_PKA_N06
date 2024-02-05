// auth_provider.dart

import 'package:flutter/material.dart';
import 'package:qldt_pka/models/auth_model.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel? _authorization;

  AuthModel? get authorization => _authorization;

  void setAuth(AuthModel auth) {
    _authorization =
        AuthModel(userId: auth.userId, accessToken: auth.accessToken);
    notifyListeners();
  }

  // Nếu bạn muốn hàm get chủ động, bạn có thể sử dụng nó trong constructor
  AuthModel? getAuth() {
    return _authorization;
  }
}
