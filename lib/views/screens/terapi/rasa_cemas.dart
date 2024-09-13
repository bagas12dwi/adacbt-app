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
                  text1: "Pada saat melaksanakan teknik ERP, kamu dapat memulainya dengan menerapkan teknik relaksasi terlebih dahulu. Kemudian, kamu dapat mencatat progres harian kamu pada blangko 4 – Frekuensi perilaku kompulsif. Serta mengukur tingkat kecemasan yang kamu alami saat melaksanakan ERP di Blangko 5 – perubahan tingkat kecemasan",
                title: 'Tahan diri kamu untuk tidak melakukan perilaku kompulsif atau berulang ya !',
              ),
              SizedBox(height: 10.h,),
              Text(
                '“Tidak apa-apa jika kamu merasa kesulitan dalam melaksanakan tugas ini. Semua butuh waktu untuk dapat terbiasa. Yang terpenting adalah kamu tetap berusaha dan menikmati prosesnya ya”.',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 18.h,
                  color: kDark,
                ),
                textAlign: TextAlign.center,
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
