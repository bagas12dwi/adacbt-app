import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImpactOcd extends StatelessWidget {
  const ImpactOcd({super.key});

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
              "Dampak dari OCD",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.h
              ),
            ),
            SizedBox(height: 5.h,),
            const Text(
              "OCD berdampak pada aktivitas sehari-hari, seperti mengalami stres, tegang dan cemas yang signifikan dikarenakan adanya perilaku yang mementingkan ketelitian dan keteraturan atau keragu-raguan ketika menghadapi sebuah situasi, serta mementingkan kehigienisan. OCD bisa menjadi masalah yang sangat parah jika tidak ditangani. Hal tersebut menyebabkan rendahnya kualitas hidup yang dimiliki orang dengan OCD, seperti tidak memiliki kesejahteraan secara psikologis serta hubungan sosial yang buruk. Tingginya tingkat keparahan OCD berdampak pada keinginan untuk bunuh diri.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
