import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HandlingOcd extends StatelessWidget {
  const HandlingOcd({super.key});

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
            Text(
              "Penanganan OCD dengan CBT",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.h
              ),
            ),
            const Text(
              "Internet Cognitive Behavior Therapy merupakan suatu intervensi yang mengacu pada konsep dasar pendekatan Cognitive Behavior yang didalamnya mencakup Restrukturisasi Kognitif dan Terapi Perilaku.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 5.h,),
            const Text(
              "Intervensi ini akan melatih keterampilan seseorang dalam menghadapi permasalahan psikologis yang berkaitan dengan pikiran, perasaan, serta perilakunya di kehidupan sehari-hari. I-CBT telah terbukti efektif dalam menangani berbagai permasalahan psikologis, salah satunya adalah penanganan terhadap orang yang mengalami OCD. Pada aplikasi ini, kamu akan melaksanakan beberapa tahap terapi yaitu Psikoedukasi, Latihan Relaksasi, Restrukturisasi Kognitif, dan Terapi Perilaku.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
