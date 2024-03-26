import 'package:flutter/material.dart';
// import 'package:quanli_diem/pages/ex_port.dart';
import 'package:tuple/tuple.dart'; // Import thư viện tuple
import 'package:qldt_pka/widgets/widgetscreenscore/avatar/info.dart';
import 'package:qldt_pka/models/student_data.dart';
import 'package:qldt_pka/widgets/widgetscreenscore/score/sum_score.dart';

class Sumpiont_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Student student = Student(name: "John Doe");
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
                    ListPoint(
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
                        Tuple2("Điểm trung bìnhsa  tích hệ 10 :",
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
