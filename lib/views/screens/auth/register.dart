import 'package:ada_cbt/controllers/login_controller.dart';
import 'package:ada_cbt/models/user.dart';
import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/constants/components/rounded_input_field.dart';
import 'package:ada_cbt/views/screens/waiting/waiting.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {

  Register({super.key});
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> _register() async{
    try{
      await loginController.register(
          emailController.text,
          passwordController.text,
          fullNameController.text,
          phoneController.text
      );

      User? loggedInUser = loginController.user.value;

      if(loggedInUser != null){
        Get.off(() => const WaitingScreen());
      }else {
        Get.snackbar('Success', 'Pendaftaran akun berhasil, admin akan segera mengkonfirmasi akunmu !', backgroundColor: kSuccess, colorText: kLight);
      }
      Get.off(() => const WaitingScreen());

    } catch (e){
      if (kDebugMode) {
        print('Error during login: $e');
      }
      Get.snackbar('Error', 'An error occurred while logging in', backgroundColor: kDanger, colorText: kLight);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            child: Obx(() {
              bool isLoading = loginController.isLoading.value;
              return Column(
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
                      RoundedInputFieldAuth(
                        hintText: "Nama Lengkap",
                        controller: fullNameController,
                      ),
                      RoundedInputFieldAuth(
                        hintText: "No. Telepon",
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        icon: Icons.phone_android,
                      ),
                      RoundedInputFieldAuth(
                        hintText: "Email",
                        controller: emailController,
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      RoundedInputPassword(
                        controller: passwordController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      RoundedButton(
                          text: isLoading ? "LOGIN IN ... " : "DAFTAR",
                          press: isLoading ? (){} : () async {
                            if(fullNameController.text != "" && emailController.text != "" && passwordController.text != "" && phoneController.text != ""){
                              loginController.isLoading.value = true;
                              await _register();
                              loginController.isLoading.value = false;
                            } else {
                              Get.snackbar("Warning", "Nama atau Email atau Password harus diisi !",margin: EdgeInsets.all(10.h), backgroundColor: Colors.amber);
                            }
                          }),
                    ],
                  ),
                ],
              );
            })
          ),
        ),
      ),
    );
  }
}
