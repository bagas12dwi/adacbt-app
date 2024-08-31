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
            SizedBox(height: 5.h,),
            const Text(
              "Cognitive Behavior Therapy atau CBT merupakan suatu intervensi yang melatih keterampilan seseorang dalam menghadapi permasalahan psikologis yang berkaitan dengan pikiran, perasaan, serta perilakunya di kehidupan sehari-hari. CBT telah terbukti efektif dalam menangani berbagai gangguan psikologis, salah satunya adalah penanganan terhadap orang yang mengalami OCD. Pada aplikasi ini kamu akan melaksanakan empat tahap CBT, yaitu psikoedukasi, latihan relaksasi, restrukturisasi kognitif, dan terapi perilaku.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
