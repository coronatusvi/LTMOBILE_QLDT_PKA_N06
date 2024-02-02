import 'package:flutter/material.dart';
import 'package:qldt_pka/view/point_management/styleguide/colors.dart';

class List_point extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 330,
        width: 250,
        decoration: BoxDecoration(
            color: backgourdColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ]),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                height: 35,
                width: 250,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 172, 171, 170),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text("Tổng điểm",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200, // Đặt chiều rộng của Container
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Đặt canh chỉnh theo chiều dọc
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tổng số tín chỉ :",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                      Text(
                        "1",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 1,
                    color: Colors.black,
                    width: 250,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              width: 200, // Đặt chiều rộng của Container
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Đặt canh chỉnh theo chiều dọc
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tổng số tín chỉ tích lũy :",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                      Text(
                        "1",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 1,
                    color: Colors.black,
                    width: 250,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              width: 200, // Đặt chiều rộng của Container
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Đặt canh chỉnh theo chiều dọc
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Điểm trung bình hệ 4 :",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                      Text(
                        "1",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 1,
                    color: Colors.black,
                    width: 250,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              width: 200, // Đặt chiều rộng của Container
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Đặt canh chỉnh theo chiều dọc
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Điểm trung bình hệ 10 :",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                      Text(
                        "1",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 1,
                    color: Colors.black,
                    width: 250,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              width: 200, // Đặt chiều rộng của Container
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Đặt canh chỉnh theo chiều dọc
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Điểm trung bình tích hệ 4 :",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                      Text(
                        "1",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 1,
                    color: Colors.black,
                    width: 250,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              width: 200, // Đặt chiều rộng của Container
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Đặt canh chỉnh theo chiều dọc
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Điểm trung bình hệ 4 :",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                      Text(
                        "1",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 1,
                    color: Colors.black,
                    width: 250,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
