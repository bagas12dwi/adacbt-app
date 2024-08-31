import 'package:ada_cbt/views/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({super.key, required this.text, required this.icon, required this.onClick});

  final String text;
  final IconData icon;
  final GestureTapCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:10.h, vertical: 3.h),
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
            Icon(icon, color: kPrimaryColor,),
            SizedBox(
              width: 10.h,
            ),
            Expanded(
              child: Text(
                  text
              ),
            )
          ],
        ),
      ),
    );
  }
}
