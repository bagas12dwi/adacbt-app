import 'package:ada_cbt/views/constants/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldPertanyaan extends StatelessWidget {
  const TextFieldPertanyaan({super.key, required this.textPertanyaan, required this.hintTextPertanyaan, required this.controller});
  final String textPertanyaan;
  final String hintTextPertanyaan;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          textPertanyaan,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.h
          ),
        ),
        SizedBox(height: 10.h,),
        RoundedInputTextArea(hintText: hintTextPertanyaan, controller: controller,),
        SizedBox(height: 10.h,)
      ],
    );
  }
}
