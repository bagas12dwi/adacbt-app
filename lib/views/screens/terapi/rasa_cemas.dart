import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/screens/terapi/components/card_rasa_cemas.dart';
import 'package:ada_cbt/views/screens/terapi/good_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RasaCemas extends StatelessWidget {
  const RasaCemas({super.key});

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
              const CardTerapi(
                  text1: "Pada saat melaksanakan teknik ERP, kamu diminta untuk mengakses blangko di sini. Blangko tersebut sebagai panduan/prosedur untuk kamu melawan rasa takut dan keragu-raguan yang kamu alami di kehidupan sehari-hari. Kamu bisa mencatat perilaku pada blangko 4, serta mengukur tingkat kecemasan yang kamu alami saat melawan rasa takut pada blangko 5. Sebelum menghadapi dan melawan rasa takut atau keraguanmu, pastikan kamu sudah menerapkan teknik relaksasi.",
                title: 'Lawan rasa cemasmu !',
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: RoundedButton(
                    text: "Lanjut",
                    color: kPrimaryColor,
                    press: () => Get.to(() => const GoodDay())
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
