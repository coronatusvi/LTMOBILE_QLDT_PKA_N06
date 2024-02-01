import 'package:flutter/material.dart';
import 'package:qldt_pka/view/point_management/commons/semester/semester.dart';
import 'package:qldt_pka/view/point_management/commons/list_view_ql.dart';

import 'package:qldt_pka/view/point_management/commons/avatar/info.dart';
import 'package:qldt_pka/view/point_management/styleguide/colors.dart';
import 'package:qldt_pka/view/point_management/commons/avatar/opaque_image.dart';
import 'package:qldt_pka/view/point_management/styleguide/text_style.dart';
import 'package:qldt_pka/view/point_management/commons/avatar/my_info.dart';

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
