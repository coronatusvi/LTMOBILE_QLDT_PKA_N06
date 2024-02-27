// Course Providers

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
  List<CourseModel>?
      _courseDataModel; // Tạo một biến có kiểu Mảng một lịch học (Là trong thời gian đó có nhiều lịch học)

  Future<List<CourseModel>?> fetchData(
      BuildContext context, String startDate, String endDate) async {
    // Tạo một hàm bất đồng độ nhận data
    AuthModel? authProvider = Provider.of<AuthDataProvider>(context,
            listen: false)
        .getAuth(); // Tạp biến nhận authorization đã lưu vào khi đăng nhập để gửi kèm api với có thể nhận kết quả.

    // Lay thoi gian thuc
    DateTime now = DateTime.now();
    int unixTimestamp = now.millisecondsSinceEpoch ~/ 1000;
    
    String course_endpoint = Config.setApiGetCourse(
      (authProvider?.userId).toString(),
      unixTimestamp,
      startDate,
      endDate,
    );
    String apiUrl =
        Config.API_URL + course_endpoint; // Là api vừa test trong Postman

    var response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authProvider?.accessToken}',
      },
    ); // Sử dụng phương Phương thức POST của thư viện http(dart) để gọi api

    if (response.statusCode == 200) {
      // Nếu call api thành công
      final Map<String, dynamic> data = json
          .decode(response.body); // Tạo biến data nhận body của response trả về
      ResponseModel couseData = ResponseModel.fromJson(
          data); // Tạo một biến có kiểu là Model tổng mà các api trả về (Là model ở trên đã hướng dẫn)

      // Đảm bảo rằng couseData.data là List
      if (couseData.data is List) {
        // Chuyển đổi danh sách Map<String, dynamic> thành danh sách CourseModel
        _courseDataModel = (couseData.data as List)
            .map((item) => CourseModel.fromJson(item))
            .toList();
        // Đặt debug ở đoạn này để xem data đã nhận về chưa

        notifyListeners(); // Lắng nghe khi data provider thay đổi
        return _courseDataModel; // trả về kết quả theo kiểu dữ liệu return của hàm fetchData()
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
