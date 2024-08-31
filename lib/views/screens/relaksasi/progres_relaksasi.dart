import 'package:ada_cbt/controllers/login_controller.dart';
import 'package:ada_cbt/controllers/relaksasi_controller.dart';
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

class ProgresRelaksasi extends StatelessWidget {
  ProgresRelaksasi({super.key});
  final RadioButtonController catatan3 = Get.put(RadioButtonController());
  final TextEditingController catatan1 = TextEditingController();
  final TextEditingController catatan2 = TextEditingController();
  final TextEditingController catatan4 = TextEditingController();
  final TextEditingController pertanyaan = TextEditingController();
  final RelaksasiController relaksasiController = Get.put(RelaksasiController());
  final LoginController userController = Get.put(LoginController());
  int? userId;

  Future<void> initializeUserId() async {
    User? user = userController.user.value;
    userId = user!.id!;
  }

  Future<void> _simpanData() async{
    try {
      await initializeUserId();
      await relaksasiController.storeRelaksasi(
          userId!,
          catatan1.text,
          catatan2.text,
          catatan3.selectedOption.value,
          catatan4.text,
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
              child: SafeArea(
                child: Obx(() {
                  bool isLoading = relaksasiController.isLoading.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Seberapa rileks dan nyaman kamu setelah melakukan teknik relaksasi",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.h
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      RoundedInputField(
                        keyboardType: TextInputType.number,
                        hintText: 'Masukkan Jawaban anda 1-10',
                        controller: catatan1,
                      ),
                      SizedBox(height: 10.h,),
                      TextFieldPertanyaan(
                        textPertanyaan: "Apa yang kamu rasakan setelah melakukan teknik relaksasi pernapasan dalam ?",
                        hintTextPertanyaan: 'Masukkan Jawaban anda',
                        controller: catatan2,
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        "Apakah ada hambatan saat melakukan teknik relaksasi pernapasan dalam ? (Ya/Tidak)",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.h
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      RadioButton(
                        options: const ['Ya', 'Tidak'],
                        controller: catatan3,

                      ),
                      SizedBox(height: 10.h,),
                      TextFieldPertanyaan(
                        textPertanyaan: "Perubahan apa saja yang terjadi setelah kamu melewati tahap relaksasi ?",
                        hintTextPertanyaan: 'Masukkan Jawaban anda',
                        controller: catatan4,
                      ),
                      SizedBox(height: 10.h,),
                      TextFieldPertanyaan(
                        textPertanyaan: "Apakah ada pertanyaan?",
                        hintTextPertanyaan: '(jika tidak ada pertanyaan bisa di isi - )',
                        controller: pertanyaan,
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Center(
                            child: RoundedButton(
                              text: isLoading? "Sedang Diproses ..." : "Kirim",
                              color: kPrimaryColor,
                              press: isLoading ? (){} : () async {
                                if (catatan1.text != '' && catatan2.text != '' && catatan4.text != '' && pertanyaan.text != ''){
                                  relaksasiController.isLoading.value = true;
                                  await _simpanData();
                                } else {
                                  Get.snackbar('Gagal', 'Semua pertanyaan wajib di isi');
                                }
                              },
                            ),
                          ))
                    ],
                  );
                })
              ),
            )
        )
    );
  }
}

