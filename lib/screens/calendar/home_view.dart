import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qldt_pka/screens/calendar/home_page.dart';
import '../../models/user_model.dart';
import '../../providers/user_provider.dart';
import '../../theme/colors/light_colors.dart';

class HomeView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => HomeView(),
      );

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      appBar: AppBar(
        title: FutureBuilder(
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
              UserModel? courseData =
                  Provider.of<UserDataProvider>(context, listen: false)
                      .getUsers(context);
              return Text("Xin chào ${courseData?.ten ?? 'No course data'}");
            }
          },
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.yellow, Colors.blue]),
          ),
        ),
      ),
      body: const HomePage(),
    );
  }
}
