import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KasusCard extends StatelessWidget {
  const KasusCard({super.key, this.title, required this.kasus});
  final String? title;
  final String kasus;

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
              title ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.h
              ),
            ),
            SizedBox(height: 5.h,),
            Text(
              kasus,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
