import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/screens/home/components/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCards extends StatelessWidget {
  CustomCards({super.key, required this.name, required this.img});
  final String name;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          _buildImage(),
          SizedBox(
            width: 10.h,
          ),
          Expanded(
            child: buildInfo(),
          )
        ],
      ),
    );
  }

  Widget _buildImage() {
    return CustomImage(
      img,
      radius: 15.h,
      height: 80.h,
      width: 100.w,
    );
  }

  Widget buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: kDark,
            fontSize: 16.h,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
      ],
    );
  }
}
