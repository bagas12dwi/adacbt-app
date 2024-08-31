import 'package:ada_cbt/controllers/login_controller.dart';
import 'package:ada_cbt/models/user.dart';
import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/constants/components/rounded_input_field.dart';
import 'package:ada_cbt/views/screens/auth/register.dart';
import 'package:ada_cbt/views/screens/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Login extends StatelessWidget {
  Login({super.key});

  final String assetName = "./assets/logo.png";
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      await loginController.login(emailController.text, passwordController.text);
      User? loggedInUser = loginController.user.value;

      if (loggedInUser != null) {
        if(loggedInUser.isActive == 1){
          Get.off(() => Home(id: loggedInUser.id!)); // Navigate to home screen
        } else {
          Get.snackbar('Login Failed', 'Akun anda belum dikonfirmasi admin');
        }
      } else {
        // Handle login failure (if needed)
        Get.snackbar('Login Failed', 'Invalid credentials');
      }
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Error during login: $e');
      }
      Get.snackbar('Error', 'An error occurred while logging in');
    }
  }


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
                    Obx(() {
                      bool isLoading = loginController.isLoading.value;
                      return Column(
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
                          RoundedInputFieldAuth(hintText: "email", controller: emailController, keyboardType: TextInputType.emailAddress),
                          RoundedInputPassword(controller: passwordController),
                          SizedBox(
                            height: 20.h,
                          ),
                          RoundedButton(
                              text: isLoading ? "LOGIN IN ... " : "LOGIN",
                              press: isLoading ? () {} : () async {
                                if(emailController.text != "" && passwordController.text != "") {
                                  loginController.isLoading.value = true;
                                  await _login();
                                  loginController.isLoading.value = false;
                                  // await checkUser();
                                } else {
                                  Get.snackbar("Warning", "Email atau Password harus diisi !",margin: EdgeInsets.all(10.h), backgroundColor: Colors.amber);
                                }
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
                      );
                    })
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
