import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/screens/restrukturisasi/components/about.dart';
import 'package:ada_cbt/views/screens/restrukturisasi/kasus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Restrukturisasi extends StatelessWidget {
  const Restrukturisasi({super.key, required this.userId});
  final int userId;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLight,
      appBar: AppBar(
        backgroundColor: kLight,
        foregroundColor: Colors.black,
        title: const Text("Restrukturisasi Kognitif"),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              const AboutRestrukturisasi(),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: RoundedButton(
                    text: "Lanjut",
                    color: kPrimaryColor,
                    press: () => Get.to(() => Kasus(userId: userId,))
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
