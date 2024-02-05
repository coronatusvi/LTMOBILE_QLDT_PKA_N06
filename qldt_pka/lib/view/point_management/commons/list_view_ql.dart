import 'package:flutter/material.dart';
import 'package:qldt_pka/view/point_management/page/transcript_screen.dart';
import 'package:qldt_pka/view/point_management/page/semester_screen.dart';
import 'package:qldt_pka/view/point_management/styleguide/colors.dart';

class List_Button_ql extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 80,
              width: 250,
              decoration: BoxDecoration(
                  color: backgourdColor,
                  borderRadius: BorderRadius.circular(25)),
              child: InkWell(
                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => Table_score()));
                // },
                child: Center(
                  child: Text(
                    "Thông Tin",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: 250,
              decoration: BoxDecoration(
                  color: backgourdColor,
                  borderRadius: BorderRadius.circular(25)),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SumPoint()));
                },
                child: Center(
                  child: Text(
                    "Tổng Điểm",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: 250,
              decoration: BoxDecoration(
                  color: backgourdColor,
                  borderRadius: BorderRadius.circular(25)),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Semester_table()));
                },
                child: Center(
                  child: Text(
                    "Bảng Điểm",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
