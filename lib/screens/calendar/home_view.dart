import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qldt_pka/features/home/view/home_view.dart';
import '../../screens/calendar/home_page.dart';
import '../../screens/logout/logout_microsoft.dart';
import '../../models/user_model.dart';
import '../../providers/user_provider.dart';

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
      backgroundColor: const Color.fromRGBO(255, 249, 236, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return LogOutWithMicrosoft_View();
                },
              ));
            },
          )
        ],
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
              UserModel? userData =
                  Provider.of<UserDataProvider>(context, listen: false)
                      .getUsers(context);
              return Text(
                  "Xin chào ${userData?.ten ?? 'No course data'} ${userData?.hoDem ?? 'No course data'}");
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
      body: const MxhView(),
    );
  }
}
