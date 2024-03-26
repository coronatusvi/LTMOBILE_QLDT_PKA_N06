import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/auth_model.dart'; // Import your AuthModel
import '../models/data_model.dart';
import '../models/user_model.dart';
import '../utils/env.dart';
import 'auth_provider.dart';

class UserDataProvider extends ChangeNotifier {
  UserModel? _UserDataModel; // Sửa thành List<UserModel>

  Future<UserModel?> fetchData(BuildContext context) async {
    AuthModel? authProvider =
        Provider.of<AuthDataProvider>(context, listen: false).getAuth();
    String user_endpoint =
        Config.setApiGetUser((authProvider?.userId).toString());
    String apiUrl = Config.API_URL + user_endpoint;

    var response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authProvider?.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      ResponseModel userData = ResponseModel.fromJson(data);

      // Đảm bảo rằng couseData.data là List
      if (userData.data is List) {
        List<UserModel> users = (userData.data as List)
            .map((item) => UserModel.fromJson(item))
            .toList();
        _UserDataModel = users?[0];

        notifyListeners();
        return _UserDataModel;
      } else {
        _UserDataModel = null;
        notifyListeners();
        return _UserDataModel;
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  UserModel? getUsers(BuildContext context) {
    return _UserDataModel;
  }
}
