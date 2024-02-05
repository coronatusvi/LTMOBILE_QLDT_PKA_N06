import 'package:flutter/material.dart';
import 'package:qldt_pka/view/point_management/commons/list_view_ql.dart';
import 'package:qldt_pka/view/point_management/commons/transcript/transcript.dart';
import 'package:qldt_pka/view/point_management/commons/transcript/student.dart';
import 'package:qldt_pka/view/point_management/app_export.dart';
import 'package:tuple/tuple.dart';

class SumPoint extends StatelessWidget {
  Student student = Student(name: "John Doe");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              HeaderInfo(),
              Expanded(
                flex: 5,
                child: Stack(
                  children: <Widget>[
                    Sumpoint_Screen(
                      pointData: [
                        Tuple2("Tổng số tín chỉ :", student.totalCredits),
                        Tuple2("Tổng số tín chỉ tích lũy :",
                            student.cumulativeCredits),
                        Tuple2(
                            "Điểm trung bình hệ 4 :", student.averageGradeH4),
                        Tuple2(
                            "Điểm trung bình hệ 10 :", student.averageGradeH10),
                        Tuple2("Điểm trung bình tích hệ 4 :",
                            student.averageGradeCumulativeH4),
                        Tuple2("Điểm trung bình tích hệ 10 :",
                            student.averageGradeCumulativeH10),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
