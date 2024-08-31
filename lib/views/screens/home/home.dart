import 'package:ada_cbt/controllers/login_controller.dart';
import 'package:ada_cbt/controllers/task_controller.dart';
import 'package:ada_cbt/helpers/helper.dart';
import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/screens/home/components/home_screen.dart';
import 'package:ada_cbt/views/screens/home/components/load_page.dart';
import 'package:ada_cbt/views/screens/home/components/profiel_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final int id;
  final LoginController userController = Get.put(LoginController());
  final TaskController taskController = Get.put(TaskController());

  Home({super.key, required this.id});

  Future<void> _loadData() async {
    await userController.getDetail(id);
    await taskController.getTask(id);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading indicator or placeholder UI
          return const LoadPage();
        } else if (snapshot.hasError) {
          // Handle error
          return const Center(
              child: Text('Error loading data'));
        } else {
          // Data loaded, build your UI
          final MyController myController = Get.put(MyController(userController: userController, userId: id));

          return Obx(() => SafeArea(
            child: RefreshIndicator(
              onRefresh: _loadData,
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
                      // Atur extendBodyBehindAppBar menjadi true
                      stretch: true,
                      onStretchTrigger: () {
                        // Fungsi yang dipanggil ketika SliverAppBar di-stretch
                        return Future<void>.value();
                      },
                    ),
                    SliverToBoxAdapter(
                      child: myController.screens.value[myController.selectedIndex.value],
                    ),
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
            ),
          ));
        }
      },
    );
  }
  Widget _builAppBar() {
    var user = userController.user.value;
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
          "Hi, ${Helpers.getFirstText((user?.fullName ?? ""))}",
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

class MyController extends GetxController {
  late LoginController userController;
  late int userId;

  MyController({required this.userController, required this.userId});

  var screens = <Widget>[].obs;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    screens.addAll([
      HomeScreen(userId: userId,),
      ProfileScreen(userId: userId,)
    ]);
    onTapped(selectedIndex.value);
  }

  void onTapped(int index) {
    selectedIndex.value = index;
  }
}


