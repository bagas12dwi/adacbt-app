import 'package:ada_cbt/views/screens/home/components/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutRestrukturisasi extends StatelessWidget {
  const AboutRestrukturisasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Container(
                margin: EdgeInsets.all(10.h),
                width: MediaQuery.of(context).size.width * .5,
                child: const Image(
                  image: AssetImage("./assets/restukturisasi_illustration.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "Restrukturisasi kognitif",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.h
              ),
            ),
            SizedBox(height: 5.h,),
            const Text(
              "Pada tahap ini kamu akan diajak untuk mampu mengubah pemikiran negatif menjadi pemikiran yang lebih positif dan proporsional dalam menghadapi sumber kecemasanmu selama ini. Namun, sebelumnya ada hal penting yang harus kamu ketahui tentang gejala Obsessive Compulsive Disorder yang sedang kamu alami. Yuk disimak!",
              textAlign: TextAlign.justify,
            ),
            const Text(
              "Perlu diketahui bahwa pikiran, emosi, dan perilaku itu saling berkaitan satu sama lain.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
