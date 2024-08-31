import 'package:ada_cbt/views/screens/home/components/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutOcd extends StatelessWidget {
  const AboutOcd({super.key});

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
              child: CustomImage(
                "./assets/ocd.png",
                width: 150.w,
                height: 150.h,
              ),
            ),
            Text(
              "Apa itu OCD?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.h
              ),
            ),
            SizedBox(height: 5.h,),
            const Text(
              "Obsessive Compulsive Disorder (OCD) merupakan suatu gangguan kecemasan yang dialami seseorang, dengan adanya pikiran yang menetap dan tidak dapat dikendalikan (obsesi). Pemikiran tersebut menyebabkan adanya dorongan yang tidak rasional dan berlebihan untuk melakukan perilaku tertentu (kompulsi). Obsesi dan kompulsi merupakan gejala OCD yang selalu muncul dan dapat mengganggu aktivitas sehari-hari.",
              textAlign: TextAlign.justify,
            ),
            const Text(
              "Orang dengan OCD sering kali berusaha untuk mengabaikan pemikirannya. Namun mereka memiliki keyakinan yang lebih besar terhadap pemikiran tersebut bahwa bisa saja pemikiran itu benar-benar terjadi. Hal ini bisa menyebabkan mereka mengalami kecemasan,  sehingga mereka melakukan perilaku kompulsif untuk mengurangi kecemasan tersebut.",
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
