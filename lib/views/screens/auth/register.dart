import 'package:ada_cbt/controllers/login_controller.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/constants/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {

  Register({super.key});
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
                      "Register",
                      style:
                      TextStyle(fontSize: 16.h, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    RoundedInputField(hintText: "Nama Lengkap", controller: loginController.namaController,),
                    RoundedInputField(hintText: "Email", controller: loginController.emailController,),
                    RoundedInputPassword(controller: loginController.passwordController,),
                    SizedBox(
                      height: 20.h,
                    ),
                    RoundedButton(
                        text: "Daftar",
                        press: () {
                          if(loginController.namaController.text != "" && loginController.emailController.text != "" && loginController.passwordController.text != ""){
                            loginController.register();
                          } else {
                            Get.snackbar("Warning", "Nama atau Email atau Password harus diisi !",margin: EdgeInsets.all(10.h), backgroundColor: Colors.amber);
                          }
                        }),
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
