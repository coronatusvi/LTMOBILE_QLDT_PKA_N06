// Lớp để lưu trữ dữ liệu từ internet
class DataModel {
  String data;

  DataModel({required this.data});
}

// Lớp để lưu thông tin sinh viên
class Student {
  String name;
  DateTime dateOfBirth;
  double score;
  String calendar;

  Student({
    required this.name,
    required this.dateOfBirth,
    required this.score,
    required this.calendar,
  });
}
