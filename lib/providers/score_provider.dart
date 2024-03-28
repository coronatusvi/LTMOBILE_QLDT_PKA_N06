// Course Providers

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/auth_model.dart'; // Import your AuthModel
import '../models/data_score_model.dart';
import '../utils/env.dart';
import 'auth_provider.dart';
import 'package:qldt_pka/models/score_model.dart';

// import '../utils/env.dart'
class CourseDataProvider extends ChangeNotifier {
  Learning_Model? _learning_model;
  List<ScoreModel>?
      _scoreDataModel; // Tạo một biến có kiểu Mảng một lịch học (Là trong thời gian đó có nhiều kỳ học)

  Future<List<ScoreModel>?> fetchData(
      BuildContext context, String startDate, String endDate) async {
    // Tạo một hàm bất đồng độ nhận data
    AuthModel? authProvider = Provider.of<AuthDataProvider>(context,
            listen: false)
        .getAuth(); // Tạp biến nhận authorization đã lưu vào khi đăng nhập để gửi kèm api với có thể nhận kết quả.

    DateTime now = DateTime.now();
    int unixTimestamp = now.millisecondsSinceEpoch ~/ 1000;

    String course_endpoint = Config.setApiScore(
      (authProvider?.userId).toString(),
      unixTimestamp,
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
      ResponseScoreModel scoreData = ResponseScoreModel.fromJson(
          data); // Tạo một biến có kiểu là Model tổng mà các api trả về (Là model ở trên đã hướng dẫn)

      // Đảm bảo rằng couseData.data là List
      if (scoreData.data?.rsdiemtrungbinhchung is List) {
        List<ScoreModel>? learningmodel = json.decode(scoreData.data!.rsdiemtrungbinhchung);
        // Chuyển đổi danh sách Map<String, dynamic> thành danh sách CourseModel
        
        _scoreDataModel = (scoreData.data as List)
            .map((item) => Learning_Model.fromJson(item))
            .cast<ScoreModel>()
            .toList();
        // Đặt debug ở đoạn này để xem data đã nhận về chưa

        notifyListeners(); // Lắng nghe khi data provider thay đổi
        return _scoreDataModel; // trả về kết quả theo kiểu dữ liệu return của hàm fetchData()
      } else {
        _scoreDataModel = null;
        notifyListeners();
        return _scoreDataModel;
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<ScoreModel>? getCourses(BuildContext context) {
    return _scoreDataModel;
  }
}
