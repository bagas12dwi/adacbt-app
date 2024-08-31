import 'package:ada_cbt/controllers/audio_controller.dart';
import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/screens/home/components/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AboutRelaksasi extends StatelessWidget {
  AboutRelaksasi({super.key});

  @override
  Widget build(BuildContext context) {
    final AudioController audioController = Get.put(AudioController());
    return WillPopScope(
      onWillPop: () async{
        if (audioController.isPlaying.value) {
          await audioController.pauseAudio();
        }
        return true; // Allow back navigation
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.h),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomImage(
                  "./assets/ocd.png",
                  width: 150.w,
                  height: 150.h,
                ),
              ),
              Text(
                "Latihan relaksasi",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.h
                ),
              ),
              SizedBox(height: 5.h,),
              const Text(
                "Latihan relaksasi bertujuan melatih kamu untuk lebih rileks, nyaman, dan mengurangi kecemasan saat menghadapi permasalahan yang kamu alami. Teknik relaksasi ini dapat kamu terapkan dikehidupan sehari-hari sebelum melakukan berbagai aktivitas",
                textAlign: TextAlign.justify,
              ),
              const Text(
                "Langkah-langkah teknik relaksasi : ",
                textAlign: TextAlign.justify,
              ),
              const Text(
                "1. Hal utama yang perlu kamu lakukan adalah mengatur posisi kamu sampai merasa nyaman ",
                textAlign: TextAlign.justify,
              ),
              const Text(
                "2. Kemudian tarik nafas secara lembut melalui hidung dalam 4 hitungan (in, 2,3,4) ",
                textAlign: TextAlign.justify,
              ),
              const Text(
                "3. Tahan napas anda sebanyak 7 hitungan (stop, 2,3,4,5,6,7) ",
                textAlign: TextAlign.justify,
              ),
              const Text(
                "4. Kemudian hembuskan nafas dari hidung secara perlahan,sebanyak 8 hitungan (out, 2,3,4,5,6,7,8) ",
                textAlign: TextAlign.justify,
              ),
              const Text(
                "5. Kembali bernapas beberapa kali dengan irama normal ",
                textAlign: TextAlign.justify,
              ),
              const Text(
                "6. Ulangi taknik ini hingga beberapa kali, sampai anda menemukan ritme pernapasan yang membuat anda merasa lebih tenang dan nyaman ",
                textAlign: TextAlign.justify,
              ),
              const Text(
                "7. Agar lebih rileks saat melaksanakan teknik ini, anda bisa sambil mendengarkan musik relaksasi dibawah ini.",
                textAlign: TextAlign.justify,
              ),
              Obx(() => RoundedButton(
                color: audioController.isPlaying.value ? kDark : kPrimaryColor,
                text: audioController.isPlaying.value == true ? "Pause" : "Play",
                press: () {
                  if (audioController.isPlaying.value == true) {
                    audioController.pauseAudio();
                  } else {
                    audioController.playAudio("asset:///assets/relaksasi.mp3");
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
