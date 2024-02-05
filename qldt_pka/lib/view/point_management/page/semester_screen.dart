import 'package:flutter/material.dart';
import 'package:qldt_pka/view/point_management/commons/semester/semester.dart';
import 'package:qldt_pka/view/point_management/commons/list_view_ql.dart';
import 'package:qldt_pka/view/point_management/app_export.dart';

class Semester_table extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              // HeaderInfo
              HeaderInfo(),
              Expanded(
                flex: 5,
                child: Stack(
                  children: <Widget>[
                    Semester_score(),
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
