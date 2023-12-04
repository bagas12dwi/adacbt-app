import 'package:ada_cbt/views/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){},
          child: Container(
            margin: EdgeInsets.all(10.h),
            padding: EdgeInsets.all(15.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.h),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.logout, color: kPrimaryColor,),
                SizedBox(
                  width: 10.h,
                ),
                const Expanded(
                  child: Text(
                    'Logout'
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
