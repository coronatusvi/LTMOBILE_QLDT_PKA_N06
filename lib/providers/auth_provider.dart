// auth_provider.dart

import 'package:flutter/material.dart';
import 'package:qldt_pka/models/auth_model.dart';
import 'package:qldt_pka/utils/env.dart';

class AuthDataProvider extends ChangeNotifier {
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

AuthModel getDataHtml(String html) {
  // Xử lý thông tin / KHÔNG ĐỘNG ĐẾN
  final regexUserId = RegExp(Config.USERID_REGEX);
  final regexTokenJWT = RegExp(Config.TOKENJWT_REGEX);
  final userId = regexUserId.firstMatch(html)?.group(1);
  final tokenJWT = regexTokenJWT.firstMatch(html)?.group(1);
  return AuthModel(userId: userId, accessToken: tokenJWT);
}
