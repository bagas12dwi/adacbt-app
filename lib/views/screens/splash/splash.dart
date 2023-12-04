import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => FutureBuilder(
          future: Future.delayed(const Duration(seconds: 4)),
          builder: (context, AsyncSnapshot snapshot) {
            return Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150.h,
                          width: 150.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("./assets/logo.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Center(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              children: [
                                Text(
                                  "Selamat Datang Di ADA-CBT",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.h,
                                  ),
                                ),
                                SizedBox(height: 3.h,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Suatu program Internet Cognitive Behavior Therapy (I-CBT) yang siap membantu kamu untuk mengatasi permasalahan Obsessive Compulsive Disorder (OCD) yang kamu alami. Aplikasi iniakan membantu kamu memahami tentang CBT, OCD dan prosedur terapi yang akan kamu jalani.",
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10.h,),
                                      const Text(
                                        "Yuk, secara perlahan kamu akan terbiasa untuk menghadapi ketakutanmu!",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                    Positioned(
                      bottom: 3.h,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: RoundedButton(
                          text: "Get Started",
                          color: kPrimaryColor,
                          press: () => Get.to(() => Login()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
