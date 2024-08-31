import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/screens/restrukturisasi/blanko_identifikasi.dart';
import 'package:ada_cbt/views/screens/restrukturisasi/components/kasus_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Kasus extends StatelessWidget {
  const Kasus({super.key, required this.userId});
  final int userId;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLight,
      appBar: AppBar(
        backgroundColor: kLight,
        foregroundColor: Colors.black,
        title: const Text("Studi Kasus"),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              const KasusCard(
                  title: "Kasus 1",
                  kasus: "Arta telah mencuci tangannya setelah memegang suatu benda yang berdebu. Tiba-tiba dia mempuanyai pemikiran yang menganggu, seperti “apakah saya sudah mencuci tangan dengan bersih ?”. Pikiran tersebut menimbulkan kecemasan bagi Arta, ia berpikiran bahwa tangan yang belum ia cuci dengan bersih akan menyebabkan ia mengalami penyakit tertentu. sehingga ia kembali mencuci tangannya untuk memastikan bahwa tangannya bersih dan ia akan aman serta bebas dari penyakit. Tanpa disadari, hal tersebut menjadi pola kebiasaan arta, untuk selalu mengulangi perilaku mencuci tangannya, karena dengan mencuci tangan ia merasa aman dan lega. "
              ),
              SizedBox(height: 10.h,),
              const KasusCard(
                  title: "Kasus 2",
                  kasus: "Anna sedang bergegas untuk berangkat ke kampusnya. Tepat di depan rumahnya, tiba-tiba muncul pemikiran “apakah saya sudah mengunci pintu rumah tadi ?”. Memikirkan hal itu, membuat ia semakin tidak yakin apakah ia sudah benar-benar mengunci pintunya. Hal tersebut membuatnya merasa tidak nyaman dan menimbulkan kecemasan. Sehingga ia memutuskan untuk kembali ke rumah dan mengecek pintu. Ketika ia sudah melakukan pengecekan ulang dan telah memastikan bahwa pintunya benar-benar terkunci akhirnya dia merasa lega dan aman. Secara tidak langsung Anna menciptakan pola : perasaan ragu dan ketidakpastian tentang pintu yang dikunci akan hilang dengan memeriksanya."
              ),
              SizedBox(height: 10.h,),
              const KasusCard(
                  title: "Kasus 3",
                  kasus: "Mitha adalah seorang perempuan yang dikenal rajin. Setiap kali ia membersihkan rumahnya ia merasa puas ketika sudah melihat semuanya bersih dan rapi. Namun, suatu waktu ada hal yang membuat ia terganggu karena melihat tumpukan buku yang tidak rapi. Ia merasa tidak nyaman sehingga untuk mengurangi perasaan tidak nyamannya Mitha kembali merapikan dan menyusun buku-buku itu dengan benar, kemudian ia merasa tenang dan lega. Hal tersebut terus terjadi tanpa ia sadari pikiran tentang suatu yang tidak beres itu terus muncul hingga ia terus merapikan kembali semua barangnya agar ia merasa lega."
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: RoundedButton(
                    text: "Lanjut",
                    color: kPrimaryColor,
                    press: () => Get.to(() => BlankoIdentifikasi(userId: userId,))
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
