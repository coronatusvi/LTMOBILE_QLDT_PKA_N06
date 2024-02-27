import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';
import '../../providers/user_provider.dart';
import '../../theme/colors/light_colors.dart';
import '../../widgets/active_project_card.dart';
import '../../widgets/task_column.dart';
import '../../widgets/top_container.dart';
import 'calendar_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LightColors.kLightYellow,
      child: FutureBuilder(
        future: Provider.of<UserDataProvider>(context, listen: false)
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
            UserModel? userData =
                Provider.of<UserDataProvider>(context, listen: false)
                    .getUsers(context);
            return ListView(
              children: [
                TopContainer(
                  height: 200,
                  child: ListView(children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 50.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.85,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: LightColors.kRed,
                            backgroundColor: LightColors.kDarkYellow,
                            center: CircleAvatar(
                              backgroundColor: LightColors.kBlue,
                              radius: 35.0,
                              // backgroundImage: AssetImage(
                              //   'assets/images/avatar.png',
                              // ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  '${userData?.hoDem} ${userData?.ten}',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: LightColors.kDarkBlue,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      'Giới tính: ${userData?.gIOITINHTEN}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      'Mã sinh viên: ${userData?.mASO}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      'Ngày sinh: ${userData?.qLSVNGUOIHOCNGAYSINH}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      'CCCD: ${userData?.cMTNDSO}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  subheading('Thông tin sinh viên'),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CalenderView.route(),
                                      );
                                    },
                                    child: calendarIcon(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.0),
                              TaskColumn(
                                icon: Icons.alarm,
                                iconBackgroundColor: LightColors.kRed,
                                title: '${userData?.khoaquanly}',
                                subtitle: 'Khoa Quản lý',
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TaskColumn(
                                icon: Icons.alarm,
                                iconBackgroundColor: LightColors.kRed,
                                title: 'Ngành ${userData?.nganh}',
                                subtitle: 'Ngành học',
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TaskColumn(
                                icon: Icons.blur_circular,
                                iconBackgroundColor: LightColors.kDarkYellow,
                                title: 'Trạng thái',
                                subtitle: '${userData?.qlsvNguoihocTrangthai}',
                              ),
                              SizedBox(height: 15.0),
                              TaskColumn(
                                icon: Icons.check_circle_outline,
                                iconBackgroundColor: LightColors.kBlue,
                                title: '${userData?.tTLLEMAILCANHAN}',
                                subtitle: 'Địa chỉ email',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              subheading('Active Projects'),
                              SizedBox(height: 5.0),
                              Row(
                                children: <Widget>[
                                  ActiveProjectsCard(
                                    cardColor: LightColors.kGreen,
                                    loadingPercent: 0.25,
                                    title: 'Medical App',
                                    subtitle: '9 hours progress',
                                  ),
                                  SizedBox(width: 20.0),
                                  ActiveProjectsCard(
                                    cardColor: LightColors.kRed,
                                    loadingPercent: 0.6,
                                    title: 'Making History Notes',
                                    subtitle: '20 hours progress',
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  ActiveProjectsCard(
                                    cardColor: LightColors.kDarkYellow,
                                    loadingPercent: 0.45,
                                    title: 'Sports App',
                                    subtitle: '5 hours progress',
                                  ),
                                  SizedBox(width: 20.0),
                                  ActiveProjectsCard(
                                    cardColor: LightColors.kBlue,
                                    loadingPercent: 0.9,
                                    title: 'Online Flutter Course',
                                    subtitle: '23 hours progress',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
