import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutTerapi extends StatelessWidget {
  const AboutTerapi({super.key, required this.text1, required this.text2, required this.text3});

  final String text1;
  final String text2;
  final String text3;

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
              "Terapi Perilaku",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.h
              ),
            ),
            SizedBox(height: 5.h,),
            Text(
              text1,
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10.h,),
            Text(
              text2,
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10.h,),
            Text(
              text3,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
