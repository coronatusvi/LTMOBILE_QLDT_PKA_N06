import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:qldt_pka/models/course_model.dart';
import 'package:qldt_pka/models/data_model.dart';
import '../models/auth_model.dart'; // Import your AuthModel
import '../utils/env.dart';
import 'auth_provider.dart';

class CourseDataProvider extends ChangeNotifier {
  List<CourseModel>? _courseDataModel; // Sửa thành List<CourseModel>

  static const String apiUrl = Config.API_URL + Config.COURSE_EDUCAION;

  Future<List<CourseModel>?> fetchData(BuildContext context) async {
    AuthModel? authProvider =
        Provider.of<AuthDataProvider>(context, listen: false).getAuth();
    var response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authProvider?.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      ResponseModel couseData = ResponseModel.fromJson(data);

      // Đảm bảo rằng couseData.data là List
      if (couseData.data is List) {
        // Chuyển đổi danh sách Map<String, dynamic> thành danh sách CourseModel
        _courseDataModel = (couseData.data as List)
            .map((item) => CourseModel.fromJson(item))
            .toList();

        notifyListeners();
        return _courseDataModel;
      } else {
        _courseDataModel = null;
        notifyListeners();
        return _courseDataModel;
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<CourseModel>? getCourses(BuildContext context) {
    return _courseDataModel;
  }
}
