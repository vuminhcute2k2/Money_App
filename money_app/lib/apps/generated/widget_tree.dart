import 'package:flutter/material.dart';
import 'package:money_app/apps/common/authentication.dart';
import 'package:money_app/apps/modules/currency/views/currency_screen.dart';
import 'package:money_app/apps/modules/home/views/navigatorhome_screen.dart';
import 'package:money_app/apps/modules/login/views/login_screen.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshotdata) {
        if (snapshotdata.hasData) {
          return const NavigatorHomeScreen();
         
        } else {
          return CurrencyScreen();
          // return LogInScreen();
        }
      },
      stream: Auth().authenStateChanges,
    );
  }
}
