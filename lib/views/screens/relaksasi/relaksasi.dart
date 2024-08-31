import 'package:ada_cbt/controllers/audio_controller.dart';
import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/screens/relaksasi/components/about.dart';
import 'package:ada_cbt/views/screens/relaksasi/progres_relaksasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Relaksasi extends StatelessWidget {
  Relaksasi({super.key});

  @override
  Widget build(BuildContext context) {
    final AudioController audioController = Get.put(AudioController());
    return Scaffold(
      backgroundColor: kLight,
      appBar: AppBar(
        backgroundColor: kLight,
        foregroundColor: Colors.black,
        title: const Text("Latihan Relaksasi"),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              AboutRelaksasi(),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: RoundedButton(
                    text: "Lanjut",
                    color: kPrimaryColor,
                    press: () {
                      if (audioController.isPlaying.value == true) {
                        audioController.pauseAudio();
                      }
                      Get.to(() => ProgresRelaksasi());
                    } ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
