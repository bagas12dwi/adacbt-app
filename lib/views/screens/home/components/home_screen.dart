import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/screens/home/components/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Task",
                style: TextStyle(
                    color: kDark,
                    fontSize: 20.h,
                  fontWeight: FontWeight.bold
                ),
              ),
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                child: Column(
                  children: [
                    SizedBox(height: 10.h,),
                    CustomCards(name: 'Psikoedukasi', img: './assets/psikoedukasi.png'),
                    SizedBox(height: 10.h,),
                    CustomCards(name: 'Latihan Relaksasi', img: './assets/latihan.png'),
                    SizedBox(height: 10.h,),
                    CustomCards(name: 'Restrukturisasi Kognitif', img: './assets/restrukturisasi.png'),
                    SizedBox(height: 10.h,),
                    CustomCards(name: 'Terapi Perilaku', img: './assets/terapi.png'),
                  ],
                ),
              ),
              ],
          ),
        ),
      ],
    );
  }
}
