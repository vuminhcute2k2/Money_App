import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:money_app/apps/modules/register/controller/register_controller.dart';
import 'package:money_app/themes/colors.dart';
import 'package:money_app/themes/images.dart';
import 'package:money_app/themes/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool? isloading = false;
  var isObscured;
  RegisterController registerController = Get.put(RegisterController());
  @override
void initState() {
  super.initState();
  isObscured = true; // or false depending on your default state
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding:const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
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
              Center(
                  child: Image.asset(ImageConstant.imgLogo,
                width: 133,
                height: 40,
              )),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
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
                      style: TextStyle(color: AppColor.backgroundColor, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16,),
              Container(
                  child: Column(
                    children: [
                      MyTextField(
                        lable: 'Full Name',
                        icons: Icons.abc,
                        onChange: registerController.fullname,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      MyTextField(
                        lable: 'email',
                        icons: Icons.email,
                        onChange: registerController.email,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          // onChanged: (String value) {
                          //   // passwordRegisterValue = value;
                          // },
                          obscureText: isObscured,
                          controller: registerController.password,
                          decoration: InputDecoration(
                            prefixIcon:const Icon(Icons.lock),
                            // errorText: passwordError,
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(0.9)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            suffixIcon: IconButton(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 12.0),
                              icon: isObscured
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  isObscured = !isObscured;
                                });
                              },
                            ),
                          ),
                          style: const TextStyle(color: Colors.black),
                          //obscureText: true,
                          obscuringCharacter: '*',
                        ),
                      ),
                      const SizedBox(height: 16,),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          // onChanged: (String value) {
                          //   // passwordRegisterValue = value;
                          // },
                          obscureText: isObscured,
                          controller: registerController.repeat,
                          decoration: InputDecoration(
                            prefixIcon:const Icon(Icons.lock),
                            // errorText: passwordError,
                            hintText: 'Repeat Password',
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(0.9)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            suffixIcon: IconButton(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 12.0),
                              icon: isObscured
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  isObscured = !isObscured;
                                });
                              },
                            ),
                          ),
                          style: const TextStyle(color: Colors.black),
                          // obscureText: true,
                          obscuringCharacter: '*',
                        ),
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, bottom: 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: AppColor.backgroundColor,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColor.backgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, AppRouterName.Continue);
                          registerController.onRegister();
                        },
                        child: Container(
                          width: 350,
                          height: 75,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: AppColor.backgroundColor,
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: const Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 7,
                              bottom: 6,
                            ),
                            child: SizedBox(
                              width: 150,
                              child: Divider(),
                            ),
                          ),
                          Text(
                            "Or",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 7,
                              bottom: 6,
                            ),
                            child: SizedBox(
                              width: 150,
                              child: Divider(),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 100,
                                height: 48,
                                padding:const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  //color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black),
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
                                padding:const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  ImageConstant.imgGoogle,
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
                                padding:const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.black
                                ),
                                child: SvgPicture.asset(
                                  ImageConstant.imgApple,
                                  width: 26,
                                  height: 26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Have An Account? ",style: TextStyle(color: Colors.black),),
                          GestureDetector(
                            onTap: (){
                              //Navigator.pushNamed(context, AppRouterName.Register);
                            },
                            child:const Text('Log in',style: TextStyle(color: AppColor.backgroundColor),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
