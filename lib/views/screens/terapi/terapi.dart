import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/screens/terapi/components/about_terapi.dart';
import 'package:ada_cbt/views/screens/terapi/rasa_cemas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Terapi extends StatelessWidget {
  const Terapi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLight,
      appBar: AppBar(
        backgroundColor: kLight,
        foregroundColor: Colors.black,
        title: const Text("Terapi Perilaku"),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              const AboutTerapi(
                  text1: "Selamat, kamu telah berhasil merubah pemikiran negatifmu menjadi lebih positif dan proporsional!.",
                  text2: "Saat ini, kamu sudah di tahap terapi perilaku atau yang disebut sebagai teknik Exposure with Respons Prevention (ERP). Teknik ini bertujuan agar kamu terbiasa menghadapi situasi yang membuatmu merasa takut, ragu-ragu, atau perasaan tidak puas kamu. Sehingga kamu bisa menjalani aktivitas sehari-hari dengan tenang, nyaman, dan bahagia.",
                  text3: "Tugas kamu adalah melawan rasa takut atau keraguanmu yang kamu alami selama ini. Setelah berhasil untuk melawan perasaan tersebut, cobalah untuk menerapkannya dalam waktu 8 hari berturut-turut."),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: RoundedButton(
                    text: "Lanjut",
                    color: kPrimaryColor,
                    press: () => Get.to(() => const RasaCemas())
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
