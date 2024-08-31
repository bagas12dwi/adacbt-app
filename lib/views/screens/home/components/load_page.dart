import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/screens/home/components/card.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LoadPage extends StatelessWidget {
  const LoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoadController myController = Get.put(LoadController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: kLight,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: kLight,
              foregroundColor: kDark,
              automaticallyImplyLeading: false,
              floating: true,
              snap: true,
              pinned: true,
              title: _builAppBar(),
            ),
            SliverToBoxAdapter(
              child: myController.screens.value[myController.selectedIndex.value],
            )
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          items: const [
            Icon(Icons.home, color: kLight),
            Icon(Icons.person_pin_rounded, color: kLight,)
          ],
          index: 0,
          backgroundColor: kLight,
          color: kPrimaryColor,
          onTap: (index) => myController.onTapped(index),
        ),
      ),
    );
  }

  Widget _builAppBar() {
    return Row(
      children:  [
        Icon(
          Icons.person,
          color: kPrimaryColor,
          size: 20.h,
        ),
        SizedBox(
          width: 10.h,
        ),
        Text(
          "Hi",
          style: TextStyle(
              color: kDark,
              fontSize: 20.h,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}

class LoadController extends GetxController {


  var screens = <Widget>[].obs;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    screens.addAll([
      const HomeScreenLoad(),
    ]);
    onTapped(selectedIndex.value);
  }

  void onTapped(int index) {
    selectedIndex.value = index;
  }
}

class HomeScreenLoad extends StatelessWidget {
  const HomeScreenLoad({super.key});

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
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  enabled: true,
                  child: Column(
                    children: [
                      SizedBox(height: 10.h,),
                      CustomCards(
                        name: 'Psikoedukasi',
                        img: './assets/psikoedukasi.png',
                        press: (){},
                      ),
                      SizedBox(height: 10.h,),
                      CustomCards(
                        name: 'Psikoedukasi',
                        img: './assets/psikoedukasi.png',
                        press: (){},
                      ),
                      SizedBox(height: 10.h,),
                      CustomCards(
                        name: 'Psikoedukasi',
                        img: './assets/psikoedukasi.png',
                        press: (){},
                      ),
                      SizedBox(height: 10.h,),
                      CustomCards(
                        name: 'Psikoedukasi',
                        img: './assets/psikoedukasi.png',
                        press: (){},
                      ),
                      SizedBox(height: 10.h,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

