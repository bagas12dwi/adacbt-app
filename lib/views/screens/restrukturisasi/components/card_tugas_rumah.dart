import 'package:ada_cbt/main.dart';
import 'package:ada_cbt/views/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardTugasRumah extends StatelessWidget {
  const CardTugasRumah({super.key});

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
              'Tugas Rumah',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.h
              ),
            ),
            SizedBox(height: 5.h,),
            Text(
              'Setalah melakukan identifikasi pemikiran negatif yang kamu alami selama ini. Kamu diminta untuk menyusun kembali pemikiran tersebut di blangko 2 – pemikiran yang muncul.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 5.h,),
            Text(
              'Pada blangko 2, tersedia beberapa kolom yaitu :',
              textAlign: TextAlign.justify,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: const Column(
                children: [
                  Text(
                    '1. Situasi, pada kolom ini kamu diminta untuk menuliskan situasi yang menyebabkan munculnya pemikiran negatif.',
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    '2. Pemikiran/keyakinan negatif yang sudah kamu isi pada blangko 1 dapat kamu pindah ke blangko 2.',
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    '3. Tingkat keyakinan dapat diisi dengan angka 1-100 sesuai dengan kondisi kamu.',
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    '4. Emosi dapat diisi dengan bagaimana perasaan kamu ketika munculnya pemikiran negatif',
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    '5. Perilaku seperti apa yang kamu lakukan selama ini ketika munculnya pemikiran dan emosi yang negatif.',
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Text(
              'Kemudian untuk menulis perubahan pemikiran negatifmu menjadi pemikiran yang lebih positif dan proporsional, tingkat keyakinan, emosi, perilaku, serta realita yang kamu dapat setelah berusaha merubah pola pikir kamu di blangko 3 – merubah pemikiran negatif menjadi lebih positif.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 5.h,),
            Text(
              'Pada blangko 3, terdiri dari beberapa kolom yaitu :',
              textAlign: TextAlign.justify,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: const Column(
                children: [
                  Text(
                    '1. Pemikiran/keyakinan positif, dapat kamu isi dengan pemikiran positif yang seperti apa yang sekiranya dapat kamu terapkan dikehidupan sehari-hari terkait dengan permasalahan yang sedang kamu alami',
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    '2. Emosi, dapat diisi sesuai dengan perasaan kamu ketika berhasil menerapkan pemikiran positif.',
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    '3. Perilaku, dapat diisi dengan bagaimana respon perilaku kamu setelah berhasil menerapkan pikiran yang positif serta diikuti dengan perasaan kamu saat itu.',
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    '4. Tingkat keyakinan, yaitu seberapa besar keyakinan kamu terhadap pemikiran positif yang kamu terapkan, 1-100 sesuai dengan kondisi kamu.',
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    '5. Realita yang didapat, dapat kamu tuliskan seusai dengan realita yang kamu dapatkan setelah merubah pemikiran menjadi lebih positif.',
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Text(
              'Kamu dapat mengerjakan tugas ini selama 7 hari berturut-turut sesuai dengan situasi yang kamu hadapi di kehidupan sehari-hari. Link blangko dapat diakses di bawah ini ya',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 15.h,),
            Center(
              child: Text(
                'Selamat mengerjakan, Enjoy your day!',
                style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.bold,
                  color: kDark
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
