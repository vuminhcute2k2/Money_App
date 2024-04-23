import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:money_app/apps/generated/widget_tree.dart';
import 'package:money_app/apps/modules/home/views/navigatorhome_screen.dart';
import 'package:money_app/apps/modules/login/views/login_screen.dart';
import 'package:money_app/apps/modules/register/views/register_screen.dart';
import 'package:money_app/apps/modules/splash/views/splash_screen.dart';

class AppRouter {
  static GetPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterName.Splash:
        return GetPageRoute(
          page: () => const SplashScreen(),
          settings: settings,
        );
      case AppRouterName.WidgetTree:
        return GetPageRoute(
          page: () => const WidgetTree(),
          settings: settings,
        );
      case AppRouterName.Login:
        return GetPageRoute(
          page: () => const LogInScreen(),
          settings: settings,
        );
      case AppRouterName.Register:
        return GetPageRoute(
          page: () => const RegisterScreen(),
          settings: settings,
        );
      case AppRouterName.NavigatorHome:
        return GetPageRoute(
          page: () => const NavigatorHomeScreen(),
          settings: settings,
        );    

    }
    return null;
  }
}
class AppRouterName{
  static const Splash = "/splash";
  static const WidgetTree = "/widgettree";
  static const Register = "/register";
  static const Login = "/login";
  static const Home = "/home";
  static const Profile='/profile';
  static const NavigatorHome = '/navigatorHome';
  static const EditAccount = '/editaccount';
  static const ListFriends ='/listfriends';
  static const Chat ='/chat';


}