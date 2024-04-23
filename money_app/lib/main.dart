import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   await Get.putAsync(() => SharedPreferences.getInstance());
  await Firebase.initializeApp();
  runApp(const MoneyApp());
}


