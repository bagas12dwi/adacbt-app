import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/screens/terapi/components/card_rasa_cemas.dart';
import 'package:ada_cbt/views/screens/terapi/terapi_progres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GoodDay extends StatelessWidget {
  const GoodDay({super.key});

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
                title: "Have a good day! Semangat untuk tetap menerapkan teknik-teknik yang kamu dapatkan selama proses terapi.",
                text1: "Masukan dan evaluasi akan disampaikan dan dilaksanakan oleh terapis pada saat pelaksanaan exposure berdasarkan perkembangan kamu setelah mengerjakan tugas yang diberikan. Setelah kamu berhasil mengerjakan tugas di blangko exposure hingga selesai, kamu bisa mengisi Catatan Progress.",
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: RoundedButton(
                    text: "Lanjut",
                    color: kPrimaryColor,
                    press: () => Get.to(() => TerapiProgres())
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
