import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:money_app/apps/modules/login/controller/login_controller.dart';
import 'package:money_app/apps/routers/app_routers.dart';
import 'package:money_app/themes/colors.dart';
import 'package:money_app/themes/images.dart';
import 'package:money_app/themes/text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  LoginController loginController = Get.put(LoginController());
  String? emailValue;
  String? passwordValue;
  String? emailError;
  String? passwordError;
  bool _isloading = false;
  var _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
    loginController.initSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Thêm dòng này để căn chỉnh toàn bộ nội dung theo chiều ngang
              children: [
                Stack(
                  children: [
                    // Lottie animation
                    LottieBuilder.asset(
                      ImageConstant.imgAnimationBackground,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.5,
                    ),
                    // Logo và nút Back
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(80),
                            ),
                            child: Image.asset(
                              ImageConstant.imgLogo,
                              width: 26,
                              height: 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Logo Ứng dụng
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Center(
                        child: Image.asset(
                          ImageConstant.imgLogo,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                    // Tiêu đề "Login"
                    Container(
                      margin:const EdgeInsets.only(top: 100),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // Support Text
                    Container(
                      margin:const EdgeInsets.only(top: 150),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'If You Need Any Support ',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Click Here',
                              style: TextStyle(
                                color: AppColor.backgroundColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Form đăng nhập
                    Container(
                      margin: const EdgeInsets.only(top: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Email TextField
                          MyTextField(
                            lable: "Email",
                            icons: Icons.email,
                            onChange: loginController.emailController,
                          ),
                          const SizedBox(height: 16),
                          // Password TextField
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              onChanged: (String value) {
                                passwordValue = value;
                              },
                              obscureText: _isObscured,
                              controller: loginController.passwordController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.9),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  padding: const EdgeInsetsDirectional.only(
                                    end: 12.0,
                                  ),
                                  icon: _isObscured
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscured = !_isObscured;
                                    });
                                  },
                                ),
                              ),
                              style: const TextStyle(color: Colors.black),
                              obscuringCharacter: '*',
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Forgot password
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              top: 10,
                              bottom: 15,
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: AppColor.backgroundColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          // Đăng nhập button
                          GestureDetector(
                            onTap: () {
                              loginController.loginUser();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 75,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              margin: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 20,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.backgroundColor,
                                borderRadius: BorderRadius.circular(80),
                              ),
                              child: const Text(
                                'ĐĂNG NHẬP',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Divider và "Đăng nhập bằng"
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  " Đăng nhập bằng ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Các nút đăng nhập bằng
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 100,
                                  height: 48,
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.grey),
                                    color: Colors.black
                                  ),
                                  child: SvgPicture.asset(
                                    ImageConstant.imgApple,
                                    width: 26,
                                    height: 26,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 100,
                                  height: 48,
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset(
                                    ImageConstant.imgFacebook,
                                    width: 26,
                                    height: 26,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 100,
                                  height: 48,
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child:Image.asset(
                                    ImageConstant.imgGoogle,
                                    width: 26,
                                    height: 26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Đăng ký link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRouterName.Register);
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    color: AppColor.backgroundColor,
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
