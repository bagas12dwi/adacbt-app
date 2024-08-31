import 'package:ada_cbt/controllers/login_controller.dart';
import 'package:ada_cbt/views/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final LoginController loginController = Get.put(LoginController());


  Future<void> checkUser() async {
    await loginController.checkUser();
  }

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) =>
            OrientationBuilder(
                builder: (context, Orientation orientation) {
                  return const Splash();
                }
            )
    );
  }


}
