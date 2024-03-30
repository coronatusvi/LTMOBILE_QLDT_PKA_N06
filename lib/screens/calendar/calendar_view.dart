import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qldt_pka/screens/calendar/selectDate.dart';
import '../../models/course_model.dart';
import '../../providers/course_provider.dart';
import '../../theme/colors/light_colors.dart';
import '../../utils/dates_list.dart';
import '../../widgets/back_button.dart';
import '../../widgets/calendar_dates.dart';
import '../../widgets/task_container.dart';

String startDate = "01/01/2024";
String endDate = "07/01/2024";
List<String> generateDateArray(String startDate, String endDate) {
  String date = startDate.split(
    "/",
  )[0];
  int day1 = int.parse(date); // 1
  String date2 = endDate.split(
    "/",
  )[0];
  int day2 = int.parse(date2);
  List<String> dateArray = [];

  for (int d = day1; d < day2; d++) {
    dateArray.add(d.toString());
  }

  return dateArray;
}

class CalenderView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => CalenderView(),
      );

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '------------------------------------------',
        maxLines: 1,
        style:
            TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
      ),
    );
  }

  List<String> dateArray = generateDateArray(startDate, endDate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<CourseDataProvider>(context, listen: false)
            .fetchData(context, startDate, endDate),
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
            return Scaffold(
              backgroundColor: LightColors.kLightYellow,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    20,
                    20,
                    0,
                  ),
                  child: Column(
                    children: <Widget>[
                      MyBackButton(),
                      SizedBox(height: 30.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Week',
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.w700),
                            ),
                            Container(
                              height: 40.0,
                              width: 120,
                              decoration: BoxDecoration(
                                color: LightColors.kGreen,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.calendar_today),
                                tooltip: 'Go to the next page',
                                onPressed: () {
                                  DatePickerExample(restorationId: "main");
                                },
                              ),
                            ),
                          ]),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Từ $startDate -> $endDate',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Lịch học',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 58.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: days.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CalendarDates(
                              day: days[index],
                              date: dates[index],
                              dayColor: index == 0
                                  ? LightColors.kRed
                                  : Colors.black54,
                              dateColor: index == 0
                                  ? LightColors.kRed
                                  : LightColors.kDarkBlue,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: courseData!.length +
                                        2, // Số lượng mục dữ liệu cộng thêm 2 cho các mục dạng vạch ngăn cách
                                    itemBuilder: (context, index) {
                                      if (index == 0 ||
                                          index == courseData.length + 1 ||
                                          index > 5) {
                                        return _dashedText();
                                      } else {
                                        return TaskContainer(
                                          title: courseData[index].tenHocPhan,
                                          phonghoc:
                                              "${courseData[index].tenPhongHoc}",
                                          subtitle:
                                              "${courseData[index].gioBatDau}h -> ${courseData[index].gioKetThuc}h Ngày: ${courseData[index].ngayHoc}",
                                          boxColor: index % 2 == 0
                                              ? LightColors.kLavender
                                              : LightColors.kLightYellow2,
                                        );
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
            ;
          }
        },
      ),
    );
  }
}
