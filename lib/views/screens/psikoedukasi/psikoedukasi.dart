import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/constants/components/rounded_button.dart';
import 'package:ada_cbt/views/screens/psikoedukasi/catatan_progres.dart';
import 'package:ada_cbt/views/screens/psikoedukasi/components/about_ocd.dart';
import 'package:ada_cbt/views/screens/psikoedukasi/components/impact_ocd.dart';
import 'package:ada_cbt/views/screens/psikoedukasi/components/reason_ocd.dart';
import 'package:ada_cbt/views/screens/psikoedukasi/components/type_ocd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Psikoedukasi extends StatelessWidget {
  const Psikoedukasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLight,
      appBar: AppBar(
        backgroundColor: kLight,
        foregroundColor: Colors.black,
        title: const Text("Psikoedukasi"),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              const AboutOcd(),
              SizedBox(height: 10.h,),
              const TypeOcd(),
              SizedBox(height: 10.h,),
              const ReasonOcd(),
              SizedBox(height: 10.h,),
              const ImpactOcd(),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: RoundedButton(
                    text: "Lanjut",
                    color: kPrimaryColor,
                    press: () => Get.to(() => CatatanProgres())),
              )
            ],
          ),
        ),
      ),
    );
  }
}
