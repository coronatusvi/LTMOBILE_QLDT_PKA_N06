import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/auth_model.dart';
import '../models/course_data_model.dart'; // Import your CourseModel
import '../utils/env.dart';
import 'auth_provider.dart';

class CouseDataProvider extends ChangeNotifier {
  CouseDataModel? _couseDataModel;
  static const String apiUrl = Config.API_URL + Config.COURSE_EDUCAION;

  Future<void> fetchData(BuildContext context) async {
    AuthModel? authProvider =
        Provider.of<AuthProvider>(context, listen: false).getAuth();
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authProvider?.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      CouseDataModel couseData = CouseDataModel.fromJson(data);
      _couseDataModel = couseData;
      notifyListeners();
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
