import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class CardTerapi extends StatelessWidget {
  const CardTerapi({super.key, required this.text1, required this.title});

  final String text1;
  final String title;
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
              title,
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
          ],
        ),
      ),
    );
  }
}
