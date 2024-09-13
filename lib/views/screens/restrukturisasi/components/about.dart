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
            Text(
              "Ayo mulai untuk merubah pemikiran negatif menjadi lebih positif sehingga pemikiran obsesif atau pemikiran menekan dapat berkurang secara perlahan.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.h
              ),
            ),
            SizedBox(height: 5.h,),
            const Text(
              "Pada tahap ini, kamu diminta untuk menuliskan semua pikiran, emosi, dan perilaku negatif yang kamu alami selama ini. Untuk prosedur pengerjaannya, kamu dapat mengakses dan mengisi blangko 1 – identifikasi pemikiran negatif. ",
              textAlign: TextAlign.justify,
            ),
            const Text(
              "Pada blangko 1, tersedia beberapa kolom diantaranya : ",
              textAlign: TextAlign.justify,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Pemikiran/keyakinan negatif yang kamu alami selama ini',),
                  Text('2. Tingkat keyakinan pada pemikiran/keyakinan dapat diisi dengan angka 1-100 sesuai dengan kondisi kamu',),
                  Text('3. Kolom emosi dapat diisi dengan bagaimana perasaan kamu ketika munculnya pemikiran negatif',),
                  Text('4. Perilaku seperti apa yang kamu lakukan selama ini ketika munculnya pemikiran dan emosi yang negatif',),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            const Text(
              'Setelah kamu berhasil mengerjakan tugas di blangko tersebut kamu bisa mengisi Catatan Progress.',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
