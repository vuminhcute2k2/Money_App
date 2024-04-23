import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/apps/modules/currency/views/currency_screen.dart';
import 'package:money_app/apps/modules/splash/views/splash_screen.dart';
import 'package:money_app/apps/routers/app_routers.dart';

class MoneyApp extends StatelessWidget {
  const MoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouterName.Splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
      // initialBinding: BindingsBuilder(() {
      //   Get.put(RequestFriendsController());
      // }),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              //return const NavigatorHomeScreen();
              return CurrencyScreen();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0XFFFBC16A)),
            );
          }
          return CurrencyScreen();
         // return const LoginScreen();
        },
      ),
    );
  }
}