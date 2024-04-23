import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:money_app/apps/modules/splash/controller/splash_controller.dart';
import 'package:money_app/themes/colors.dart';
import 'package:money_app/themes/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   final SplashController splashController = Get.put(SplashController());
   
  @override
  void initState() {
    splashController.requestPermission();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Center(
         // child: Image.asset('assets/images/img_spotify_logo_rgb_green.png',width: 266,height: 80,),
         child: Image.asset(ImageConstant.imgLogo,),
        ),
      ),
    );
  }
}