import 'package:ada_cbt/controllers/login_controller.dart';
import 'package:ada_cbt/controllers/terapi_controller.dart';
import 'package:ada_cbt/models/user.dart';
import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/constants/components/rounded_input_field.dart';
import 'package:ada_cbt/views/screens/home/components/textfield_pertanyaan.dart';
import 'package:ada_cbt/views/screens/home/home.dart';
import 'package:ada_cbt/views/screens/psikoedukasi/catatan_progres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TerapiProgres extends StatelessWidget {
  TerapiProgres({super.key});
  final TextEditingController catatan1 = TextEditingController();
  final RadioButtonController catatan2 = Get.put(RadioButtonController());
  final TextEditingController catatan3 = TextEditingController();
  final TextEditingController catatan4 = TextEditingController();
  final TextEditingController catatan5 = TextEditingController();
  final RadioButtonController catatan6 = Get.put(RadioButtonController());
  final TextEditingController pertanyaan = TextEditingController();
  final LoginController userController = Get.put(LoginController());
  final TerapiController terapiController = Get.put(TerapiController());
  int? userId;

  Future<void> initializeUserId() async {
    User? user = userController.user.value;
    userId = user!.id!;
  }

  Future<void> _simpanData () async {
    try {
      await initializeUserId();
      await terapiController.storeTerapi(
          userId!,
          catatan1.text,
          catatan2.selectedOption.value,
          catatan3.text,
          catatan4.text,
          catatan5.text,
          catatan6.selectedOption.value,
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
                  bool isLoading = terapiController.isLoading.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldPertanyaan(
                        textPertanyaan: "Apa yang kamu rasakan dan pikirkan setelah mengerjakan tugas di blangko exposure?",
                        hintTextPertanyaan: 'Masukkan Jawaban anda',
                        controller: catatan1,
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        "AApakah tugas ini cukup membantu kamu untuk menghadapi situasi yang menyebabkan kecemasan atau keraguan bagi kamu ? (Ya/Tidak)",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.h
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      RadioButton(
                        options: const ['Ya', 'Tidak'],
                        controller: catatan2,
                      ),
                      SizedBox(height: 10.h,),
                      TextFieldPertanyaan(
                        textPertanyaan: "Perubahan apa saja yang kamu rasakan setelah melewati tahap terapi perilaku ?",
                        hintTextPertanyaan: 'Masukkan Jawaban anda',
                        controller: catatan3,
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        "Seberapa besar manfaat yang kamu dapatkan setelah melaksanakan tahap ini? 1–10 ",
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
                      TextFieldPertanyaan(
                        textPertanyaan: "Apakah kamu bersedia untuk menerapkan teknik ini secara mandiri ketika proses terapi selesai ?",
                        hintTextPertanyaan: 'Masukkan Jawaban anda',
                        controller: catatan5,
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        "AApakah tugas ini cukup membantu kamu untuk menghadapi situasi yang menyebabkan kecemasan atau keraguan bagi kamu ? (Ya/Tidak)",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.h
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      RadioButton(
                        options: const ['Ya', 'Tidak'],
                        controller: catatan6,
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
                              if (catatan1.text != '' && catatan3.text != '' && catatan4.text != '' && catatan5.text != '' && pertanyaan.text != ''){
                                terapiController.isLoading.value = true;
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
