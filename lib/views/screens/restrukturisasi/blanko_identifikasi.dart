import 'package:ada_cbt/controllers/document_controller.dart';
import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/screens/restrukturisasi/components/card_tugas_rumah.dart';
import 'package:ada_cbt/views/screens/restrukturisasi/components/kasus_card.dart';
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
        title: const Text("Blanko Identifikasi"),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              const KasusCard(
                  title: "Identifikasi Pemikiran Negatif",
                  kasus: "Pada tahap ini, kamu diminta untuk menuliskan semua pikiran, emosi, dan perilaku negatif yang kamu alami selama ini. Untuk prosedur pengerjaannya, kamu dapat mengakses dan mengisi blangko 1 identifikasi pemikiran negatif di sini. Setelah kamu berhasil mengerjakan tugas di blangko tersebut kamu bisa mengisi Catatan Progress "
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
