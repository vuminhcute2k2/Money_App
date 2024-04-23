import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/apps/common/authentication.dart';
import 'package:money_app/apps/routers/app_routers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
           Get.toNamed(AppRouterName.Login);
        },
        child: Text('log out'),
      ),
    );
  }
}