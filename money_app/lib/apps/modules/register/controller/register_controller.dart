import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/apps/common/authentication.dart';
import 'package:money_app/apps/routers/app_routers.dart';

class RegisterController extends GetxController{
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repeat = TextEditingController();
  final FirebaseAuth _auth =FirebaseAuth.instance;
  
void onRegister() async {
    // Gọi hàm signUpUser từ Auth controller
    await Auth().signUpUser(
      email: email.text.trim(),
      fullname: fullname.text.trim(),
      password: password.text.trim(),
      image: '',
      about: '',

    );

    // Lấy giá trị của biến error từ Auth controller
    String errorMessage = Auth().error.value;
    if (errorMessage.isEmpty) {
      // Đăng ký thành công,
      Get.toNamed(AppRouterName.NavigatorHome);
    } else {
      // Hiển thị thông báo lỗi
      Get.snackbar('Error', errorMessage);
    }
  }


}