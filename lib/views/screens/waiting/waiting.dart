import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 350.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('./assets/pending.png')
                    )
                  ),
                ),
                Text(
                  'Mohon untuk menunggu, pendaftaran anda sedang diproses admin!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.h
                  ),
                ),
                RoundedButton(
                    text: 'Kembali ke Halaman Awal',
                    press: () => Get.off(() => Login())
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
