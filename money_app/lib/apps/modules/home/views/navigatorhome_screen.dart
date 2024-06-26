import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_app/apps/modules/home/views/homepage_screen.dart';
import 'package:money_app/apps/modules/home/views/profile_screen.dart';
import 'package:money_app/apps/modules/home/views/report_screen.dart';
import 'package:money_app/apps/modules/home/views/wallet_screen.dart';
import 'package:money_app/themes/colors.dart';
import 'package:money_app/themes/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigatorHomeScreen extends StatefulWidget {
  const NavigatorHomeScreen({super.key});

  @override
  State<NavigatorHomeScreen> createState() => _NavigatorHomeScreenState();
}

class _NavigatorHomeScreenState extends State<NavigatorHomeScreen> {
  SharedPreferences? prefs;
  String username = "";
  void initSharedPref() async {
    // Doi shared prefs nay phai khoi tao xong
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    initSharedPref();
    getUserName();
    //_homeCubit.getItems();
    super.initState();
  }

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    print(snap.data());
  }

  int currentTab = 0;
  final List<Widget> screens = [
    //chuyển màn cho bottom bar
    const HomePageScreen(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePageScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 4.0,
          ),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          child: IconButton(onPressed: (){}, icon:const Icon(Icons.add)),
          onPressed: () {
            // Get.defaultDialog(
            //   backgroundColor: Colors.black.withOpacity(0),
            //   content: Container(
            //     height: 400, 
            //     width: 400, 
            //     child: Lottie.asset('assets/json/animation2.json'),
            //   ),
            // );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white10,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomePageScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.home,
                        //   color:
                        //       currentTab == 0 ? Color(0XFFFBC16A) : Colors.grey,
                        // ),
                        SvgPicture.asset(
                          ImageConstant.imgProfile,
                          color: currentTab == 0
                              ? AppColor.backgroundColor
                              : Colors.grey,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: currentTab == 0
                                ? AppColor.backgroundColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const WalletScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImageConstant.imgProfile,
                          color: currentTab == 1
                              ? AppColor.backgroundColor
                              : Colors.grey,
                        ),
                        Text(
                          "Tài khoản",
                          style: TextStyle(
                            color: currentTab == 1
                                ? AppColor.backgroundColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const ReportScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImageConstant.imgProfile,
                          color: currentTab == 2
                              ? AppColor.backgroundColor
                              : Colors.grey,
                        ),
                        Text(
                          "History",
                          style: TextStyle(
                            color: currentTab == 2
                                ? AppColor.backgroundColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const ProfileScreen();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImageConstant.imgProfile,
                          color: currentTab == 3
                              ? const Color(0XFFF42C83C)
                              : Colors.grey,
                        ),
                        Text(
                          "Account",
                          style: TextStyle(
                            color: currentTab == 3
                                ? const Color(0XFFF42C83C)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
