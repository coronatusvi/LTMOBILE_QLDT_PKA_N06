import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'package:qldt_pka/theme/colors/light_colors.dart';
import 'package:qldt_pka/theme/text_style.dart';

import 'package:qldt_pka/widgets/widgetscreenscore/avatar/opaque_image.dart';
import 'package:qldt_pka/widgets/widgetscreenscore/avatar/radial_progress.dart';
import 'package:qldt_pka/widgets/widgetscreenscore/avatar/rouded_image.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadialProgress(
            child: RoundedImage(
              imagePath: "assets/images/cv.jpg",
              size: Size.fromWidth(120.0),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Le Hoang Ngoc Tu",
                style: whiteNameTextStyle.copyWith(
                    fontSize: 13.0, color: Colors.black),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "MSV: 20010801",
                style: whiteNameTextStyle.copyWith(
                    fontSize: 11.0, color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
