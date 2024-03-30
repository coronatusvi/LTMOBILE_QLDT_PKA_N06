import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qldt_pka/features/home/view/home_view.dart';
import 'package:qldt_pka/screens/calendar/home_page.dart';
import '../../constants/assets_constants.dart';
import '../../features/home/view/widget/bottom_appbar_icon.dart';
import '../../features/tweet/views/create_tweet_view.dart';
import '../../screens/logout/logout_microsoft.dart';
import '../../models/user_model.dart';
import '../../providers/user_provider.dart';
import '../../theme/pallete.dart';

class HomeView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => HomeView(),
      );

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;

  void onPageChange(int index) {
    setState(() {
      _page = index;
    });
  }

  onCreateTweet() {
    Navigator.push(context, CreateTweetScreen.route());
  }

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
      body: HomePage(),
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: const BorderRadius.only(
      //     topRight: Radius.circular(30),
      //     topLeft: Radius.circular(30),
      //   ),
      //   child: BottomNavigationBar(
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     currentIndex: _page,
      //     onTap: onPageChange,
      //     backgroundColor: Pallete.rhinoDark700,
      //     type: BottomNavigationBarType.fixed,
      //     items: [
      //       BottomNavigationBarItem(
      //         activeIcon: SvgPicture.asset(
      //           AssetsConstants.homeOutlinedIcon,
      //           color: Pallete.yellow800,
      //         ),
      //         icon: SvgPicture.asset(
      //           AssetsConstants.homeOutlinedIcon,
      //           color: Pallete.whiteColor,
      //         ),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         activeIcon: SvgPicture.asset(
      //           AssetsConstants.searchIcon,
      //           color: Pallete.yellow800,
      //         ),
      //         icon: BottomAppBarIcon(
      //           icon: SvgPicture.asset(
      //             AssetsConstants.searchIcon,
      //             color: Pallete.whiteColor,
      //           ),
      //           page: _page,
      //           right: 40,
      //           left: 0,
      //         ),
      //         label: 'Search',
      //       ),
      //       BottomNavigationBarItem(
      //         activeIcon: SvgPicture.asset(
      //           AssetsConstants.notifOutlinedIcon,
      //           color: Pallete.yellow800,
      //         ),
      //         icon: BottomAppBarIcon(
      //           icon: SvgPicture.asset(
      //             AssetsConstants.notifOutlinedIcon,
      //             color: Pallete.whiteColor,
      //           ),
      //           page: _page,
      //           right: 0,
      //           left: 40,
      //         ),
      //         label: 'Notifications',
      //       ),
      //       BottomNavigationBarItem(
      //         activeIcon: SvgPicture.asset(
      //           AssetsConstants.profileIcon,
      //           color: Pallete.yellow800,
      //         ),
      //         icon: SvgPicture.asset(
      //           AssetsConstants.profileIcon,
      //           color: Pallete.whiteColor,
      //         ),
      //         label: 'Profile',
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: _page == 0
      //     ? FloatingActionButton(
      //         onPressed: () {
      //           // Handle FloatingActionButton click
      //           Navigator.push(context, CreateTweetScreen.route());
      //         },
      //         child: Container(
      //           width: 60,
      //           height: 60,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             gradient: Pallete.cardColor,
      //           ),
      //           child: const Icon(
      //             Icons.add,
      //             color: Pallete.whiteColor,
      //           ),
      //         ),
      //         shape: CircleBorder(),
      //       )
      //     : null,
      // floatingActionButtonLocation:
      //     _page == 0 ? FloatingActionButtonLocation.centerDocked : null,
    );
  }
}
