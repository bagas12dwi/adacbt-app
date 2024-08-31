import 'package:ada_cbt/controllers/task_controller.dart';
import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/screens/home/components/card.dart';
import 'package:ada_cbt/views/screens/psikoedukasi/psikoedukasi.dart';
import 'package:ada_cbt/views/screens/relaksasi/relaksasi.dart';
import 'package:ada_cbt/views/screens/restrukturisasi/restrukturisasi.dart';
import 'package:ada_cbt/views/screens/terapi/terapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final int userId;
  final TaskController taskController = Get.put(TaskController());

  HomeScreen({super.key, required this.userId});

  Future<void> _refreshData() async {
    await taskController.getTask(userId);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 10.h,),
                      CustomCards(
                        name: 'Psikoedukasi',
                        img: './assets/psikoedukasi.png',
                        press: () => Get.to(() => const Psikoedukasi()),
                      ),
                      SizedBox(height: 10.h,),
                      CustomCards(
                        name: 'Latihan Relaksasi',
                        img: './assets/latihan.png',
                        press: () {
                          if (taskController.task.value?.relaksasi != 0) {
                            Get.to(() => Relaksasi());
                          } else {
                            Get.snackbar("Failed !", "Fitur ini belum tersedia, silahkan selesaikan tahapan psikoedukasi", margin: EdgeInsets.all(10.h), backgroundColor: Colors.amber);
                          }
                        },
                      ),
                      SizedBox(height: 10.h,),
                      CustomCards(
                        name: 'Restrukturisasi Kognitif',
                        img: './assets/restrukturisasi.png',
                        press: () {
                          if (taskController.task.value?.restrukturisasi != 0) {
                            Get.to(() => Restrukturisasi(userId: userId,));
                          } else {
                            Get.snackbar("Failed !", "Fitur ini belum tersedia, silahkan selesaikan tahapan Latihan Relaksasi", margin: EdgeInsets.all(10.h), backgroundColor: Colors.amber);
                          }
                        },
                      ),
                      SizedBox(height: 10.h,),
                      CustomCards(
                        name: 'Terapi Perilaku',
                        img: './assets/terapi.png',
                        press: () {
                          if (taskController.task.value?.terapi != 0) {
                            Get.to(() => const Terapi());
                          } else {
                            Get.snackbar("Failed !", "Fitur ini belum tersedia, silahkan selesaikan tahapan Restrukturisasi Kognitif", margin: EdgeInsets.all(10.h), backgroundColor: Colors.amber);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

