import 'package:ada_cbt/controllers/login_controller.dart';
import 'package:ada_cbt/controllers/psikoedukasi_controller.dart';
import 'package:ada_cbt/models/user.dart';
import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/constants/components/rounded_input_field.dart';
import 'package:ada_cbt/views/screens/home/components/textfield_pertanyaan.dart';
import 'package:ada_cbt/views/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CatatanProgres extends StatelessWidget {
  CatatanProgres({super.key});
  final RadioButtonController catatan5 = Get.put(RadioButtonController());
  final TextEditingController catatan1 = TextEditingController();
  final TextEditingController catatan2 = TextEditingController();
  final TextEditingController catatan3 = TextEditingController();
  final TextEditingController catatan4 = TextEditingController();
  // final TextEditingController catatan5 = TextEditingController();
  final TextEditingController pertanyaan = TextEditingController();
  final PsikoedukasiController psikoedukasiController = Get.put(PsikoedukasiController());
  final LoginController userController = Get.put(LoginController());
  int? userId;

  Future<void> initializeUserId() async {
    User? user = userController.user.value;
    userId = user!.id!;
  }

  Future<void> _simpanData () async {
    try {
      await initializeUserId();
      await psikoedukasiController.storePsikoedukasi(
          userId!,
          catatan1.text,
          catatan2.text,
          catatan3.text,
          catatan4.text,
          catatan5.selectedOption.value,
          pertanyaan.text
      );
      Get.off(() => Home(id: userId!));
    } catch (e) {
      Get.snackbar('Save Data Failed', 'Simpan data gagal silahkan cek kembali');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLight,
      appBar: AppBar(
        backgroundColor: kLight,
        foregroundColor: Colors.black,
        title: const Text("Catatan Progress"),
      ),
        body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: Obx(() {
                bool isLoading = psikoedukasiController.isLoading.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldPertanyaan(
                      textPertanyaan: "Apakah Tahap ini dapat membantu kamu memahami permasalahan yang kamu alami?",
                      hintTextPertanyaan: 'Masukkan Jawaban anda',
                      controller: catatan1,
                    ),
                    TextFieldPertanyaan(
                      textPertanyaan: "Bagaimana perasaan dan pikiran kamu setelah melewati tahap ini?",
                      hintTextPertanyaan: 'Masukkan Jawaban anda',
                      controller: catatan2,
                    ),
                    TextFieldPertanyaan(
                      textPertanyaan: "Apa harapan kamu ke depan setelah mengikuti tahap ini?",
                      hintTextPertanyaan: 'Masukkan Jawaban anda',
                      controller: catatan3,
                    ),
                    Text(
                      "Seberapa besar perubahan yang terjadi setelah kamu melewati tahap psikoedukasi? 1–10",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.h
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    RoundedInputField(
                      keyboardType: TextInputType.number,
                      hintText: 'Masukkan Jawaban anda 1-10',
                      controller: catatan4,
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      "Apakah kamu sudah siap untuk mengikuti tahap selanjutnya ?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.h
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    RadioButton(
                      options: const ['Ya', 'Tidak'],
                      controller: catatan5,
                    ),
                    SizedBox(height: 10.h,),
                    TextFieldPertanyaan(
                      textPertanyaan: "Apakah ada pertanyaan?",
                      hintTextPertanyaan: 'Masukkan Jawaban anda',
                      controller: pertanyaan,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Center(
                        child: RoundedButton(
                          text: isLoading ? "Sedang Diproses ... " : "Kirim",
                          color: kPrimaryColor,
                          press: isLoading ? (){} : () async{
                            if (catatan1.text != '' && catatan2.text != '' && catatan3.text != '' && catatan4.text != '' && pertanyaan.text != ''){
                              psikoedukasiController.isLoading.value = true;
                              await _simpanData();
                            } else {
                              Get.snackbar('Gagal', 'Semua pertanyaan wajib di isi');
                            }
                          },
                        ),
                      ),
                    )
                  ],
                );
              })
            )
        )
    );
  }
}

class RadioButtonController extends GetxController {
  RxString selectedOption = 'Ya'.obs;
}



