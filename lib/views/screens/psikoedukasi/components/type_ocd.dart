import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypeOcd extends StatelessWidget {
  const TypeOcd({super.key});

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
              "Apa saja jenis OCD?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.h
              ),
            ),
            SizedBox(height: 5.h,),
            const Text(
              "1. Ketakutan Akan Kontaminasi",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "Biasanya orang dengan jenis OCD ini sering kali melakukan kegiatan yang berulang seperti mencuci tangan dan kaki, serta mandi. Seseorang yang takut terkontaminasi sering kali disebabkan oleh ketakutanya terhadap suatu penyakit atau juga dapat disebabkan oleh kebiasaannya.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 5.h,),
            const Text(
              "2. Pengecekan",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "Seseorang dengan jenis OCD ini sering kali melakukan pengecekan secara berulang dengan tujuan untuk memastikan bahwa sesuatu telah terjadi atau tidak dan melakukan pemeriksaan dengan cara-cara tertentu sesuai kebiasaannya.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 5.h,),
            const Text(
              "3. Keteraturan",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "Ciri OCD ini terlihat pada mereka yang sangat memperhatiakan keteraturan dalam menyusun barang atau melakukan tindakan yang mengutamakan urutan tertentu. Tidak hanya perilaku yang terlihat, orang dengan OCD jenis keteraturan ini sering kali melakukan tindakan mental yang berulang seperti menghitung secara diam-diam sebuat jendela dalam ruangan.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
