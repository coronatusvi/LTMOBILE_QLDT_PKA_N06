import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/course_model.dart';
import '../../providers/course_provider.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Provider.of<CourseDataProvider>(context, listen: false)
            .fetchData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading state
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Error state
            return Text('Error: ${snapshot.error}');
          } else {
            // Data loaded successfully
            List<CourseModel>? courseData =
                Provider.of<CourseDataProvider>(context, listen: false)
                    .getCourses(context);
            return Text(
                "Log Lịch học: ${courseData?[0].tenHocPhan ?? 'No course data'}");
          }
        },
      ),
    );
  }
}
