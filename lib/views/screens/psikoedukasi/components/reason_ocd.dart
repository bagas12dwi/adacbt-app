import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReasonOcd extends StatelessWidget {
  const ReasonOcd({super.key});

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
              "Penyebab OCD?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.h
              ),
            ),
            SizedBox(height: 5.h,),
            const Text(
              "- Pengaruh Genetik",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "Seseorang dapat memiliki risiko mengalami OCD yang disebabkan oleh faktor keluarga seperti orang tua dan saudara kandung. Risiko tersebut akan semakin meningkat ketika OCD dialami sejak masa kanak-kanak hingga remaja.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 5.h,),
            const Text(
              "- Kebiasaan atau budaya",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "Orang yang mengalami OCD kemungkinan dapat disebabkan oleh lingkungan yang tidak mendukung perkembangan psikologis sejak masa kecil. Seperti sering diejek atau diremehkan sehingga hal tersebut dapat menjadi pemicu bagi seseorang dalam membentuk kebiasaan untuk melakukan hal yang sempurna.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 5.h,),
            const Text(
              "- Peristiwa Traumatis",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "Peristiwa traumatis dapat menjadi pemicu bagi orang yang berisiko mengalami OCD. peristiwa tersebut dapat menyebabkan shock pada orang yang mengalaminya seperti pelecehan seksual atau mengalami perlakuan yang kasar dari orang lain.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
