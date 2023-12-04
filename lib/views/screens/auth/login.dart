import 'package:ada_cbt/controllers/login_controller.dart';
import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/constants/components/rounded_input_field.dart';
import 'package:ada_cbt/views/screens/auth/register.dart';
import 'package:ada_cbt/views/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Login extends StatelessWidget {
  Login({super.key});

  final String assetName = "./assets/logo.png";
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("./assets/logo.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Login",
                      style:
                      TextStyle(fontSize: 16.h, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    RoundedInputField(hintText: "email", controller: loginController.emailController,),
                    RoundedInputPassword(controller: loginController.passwordController),
                    SizedBox(
                      height: 20.h,
                    ),
                    RoundedButton(text: "LOGIN", press: () {
                      Get.to(() => Home(id: 1));
                      // if(loginController.emailController.text != "" && loginController.passwordController.text != "") {
                      //   loginController.login();
                      // } else {
                      //   Get.snackbar("Warning", "Email atau Password harus diisi !",margin: EdgeInsets.all(10.h), backgroundColor: Colors.amber);
                      // }
                    }),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Belum Punya Akun ? ",
                      style: TextStyle(fontSize: 10.h),
                    ),
                    RoundedButton(
                        text: "Register",
                        color: kSecondaryColor,
                        press: () => Get.to(() => Register()))
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
