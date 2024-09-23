import 'package:ada_cbt/controllers/document_controller.dart';
import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/screens/restrukturisasi/components/card_tugas_rumah.dart';
import 'package:ada_cbt/views/screens/restrukturisasi/progres_restrukturisasi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BlankoIdentifikasi extends StatelessWidget {
  BlankoIdentifikasi({super.key, required this.userId});
  final DocumentController documentController = Get.put(DocumentController());
  late String documentLink;
  final int userId;


  Future<void> _getData() async{
    await documentController.getDocument(userId);
    documentLink = documentController.document.value?.documentLink ?? '';

    if(documentLink != ""){
      try{
        await launchUrl(
            Uri.parse(documentLink),
            mode: LaunchMode.externalApplication
        );
      } catch (e){
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      Get.snackbar("Failde", "Dokumen tidak ada");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLight,
      appBar: AppBar(
        backgroundColor: kLight,
        foregroundColor: Colors.black,
        title: const Text("Restrukturisasi Kognitif"),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              Container(
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
                        "Ayo mulai untuk merubah pemikiran negatif menjadi lebih positif sehingga pemikiran obsesif atau pemikiran menekan dapat berkurang secara perlahan.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.h,
                            color: kPrimaryColor
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Pada tahap ini, kamu diminta untuk menuliskan semua pikiran, emosi, dan perilaku negatif yang kamu alami selama ini. Untuk prosedur pengerjaannya, kamu dapat mengakses dan mengisi blangko 1 – identifikasi pemikiran negatif.",
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 5.h,),
                      const Text(
                        "Pada blangko 1, tersedia beberapa kolom diantaranya :",
                        textAlign: TextAlign.justify,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('1. '),
                                SizedBox(width: 5.w,),
                                Expanded(
                                  child: Text(
                                    "Pemikiran/keyakinan negatif yang kamu alami selama ini",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('2. '),
                                SizedBox(width: 5.w,),
                                Expanded(
                                  child: Text(
                                    "Tingkat keyakinan pada pemikiran/keyakinan dapat diisi dengan angka 1-100 sesuai dengan kondisi kamu",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('3. '),
                                SizedBox(width: 5.w,),
                                Expanded(
                                  child: Text(
                                    "Kolom emosi dapat diisi dengan bagaimana perasaan kamu ketika munculnya pemikiran negatif",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('4. '),
                                SizedBox(width: 5.w,),
                                Expanded(
                                  child: Text(
                                    "Perilaku seperti apa yang kamu lakukan selama ini ketika munculnya pemikiran dan emosi yang negatif",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      const Text(
                        "Setelah kamu berhasil mengerjakan tugas di blangko tersebut kamu bisa mengisi Catatan Progress.",
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              const CardTugasRumah(),
              RoundedButton(
                  text: "Download Blanko",
                  color: kPrimaryColor,
                  press: () {
                    _getData();
                  }
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: RoundedButton(
                    text: "Lanjut",
                    color: kPrimaryColor,
                    press: () => Get.to(() => ProgresRestrukturisasi())
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
