import 'package:flutter/material.dart';
import 'package:qldt_pka/theme/colors/light_colors.dart';
import 'package:tuple/tuple.dart'; // Import thư viện tuple

class ListPoint extends StatelessWidget {
  final List<Tuple2<String, num>> pointData;

  ListPoint({required this.pointData});

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
          ],
        ),
        child: Column(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                height: 35,
                width: 250,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 172, 171, 170),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text("Tổng điểm",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  pointData.length,
                  (index) => buildDataRow(pointData[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDataRow(Tuple2<String, num> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.item1, // Data label
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
            Text(
              "${data.item2}", // Corresponding score
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
        SizedBox(height: 14),
      ],
    );
  }
}
