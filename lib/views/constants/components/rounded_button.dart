import 'package:ada_cbt/views/constants/colors.dart';
import 'package:ada_cbt/views/screens/psikoedukasi/catatan_progres.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final GestureTapCallback press;
  final Color color, textColor;
  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}



class RadioButton extends StatelessWidget {
  final List<String> options;
  final RadioButtonController controller;

  const RadioButton({super.key, required this.options, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options
          .map(
            (option) => Obx(
              () => RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: controller.selectedOption.value,
            onChanged: (value) {
              controller.selectedOption.value = value!;
            },
          ),
        ),
      )
          .toList(),
    );
  }
}
