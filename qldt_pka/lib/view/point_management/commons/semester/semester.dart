import 'package:flutter/material.dart';
import 'package:qldt_pka/view/point_management/page/transcript_screen.dart';
import 'package:qldt_pka/view/point_management/page/semester_screen.dart';
import 'package:qldt_pka/view/point_management/styleguide/colors.dart';

class Semester_score extends StatelessWidget {
  final List<String> semesterData = [
    "Kì 1 - Năm 2020",
    "Kì 2 - Năm 2020",
    "Kì 1 - Năm 2021",
    "Kì 2 - Năm 2021",
    "Kì 1 - Năm 2022",
    "Kì 2 - Năm 2022",
    "Kì 1 - Năm 2023"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: semesterData.length,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 70,
            width: 200,
            decoration: BoxDecoration(
              color: backgourdColor,

              // borderRadius: 1,
            ),
            child: Center(
              child: Text(
                '${semesterData[index]}',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
