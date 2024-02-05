import 'package:flutter/material.dart';

import 'home_page.dart';

class CalenderView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => CalenderView(),
      );

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
