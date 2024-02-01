import 'package:flutter/material.dart';
import 'package:qldt_pka/view/point_management/styleguide/colors.dart';
import 'package:qldt_pka/view/point_management/commons/avatar/opaque_image.dart';
import 'package:qldt_pka/view/point_management/styleguide/text_style.dart';
import 'package:qldt_pka/view/point_management/commons/avatar/my_info.dart';

class HeaderInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Stack(
        children: <Widget>[
          OpaqueImage(
              // imageUrl: "assets/images/cv.jpg",
              ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "assets/images/logoPhenikaa.png",
                      width: 80,
                      height: 60,
                    ),
                  ),
                  MyInfo(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
