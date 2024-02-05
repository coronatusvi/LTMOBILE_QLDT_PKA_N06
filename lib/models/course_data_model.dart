import 'package:qldt_pka/models/course_model.dart';

class CouseDataModel {
  late final List<CourseModel> data;
  late final String message;
  late final bool success;
  late final dynamic pager;
  late final dynamic id;

  CouseDataModel({
    required this.data,
    required this.message,
    required this.success,
    required this.pager,
    required this.id,
  });

  factory CouseDataModel.fromJson(Map<String, dynamic> json) {
    return CouseDataModel(
      data: json['Data'],
      id: json['Id'],
      message: json['Message'],
      pager: json['Pager'],
      success: json['Success'],
    );
  }
}
