import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? bgColor;
  final String text;
  const CustomElevatedButton({
    super.key,
    this.bgColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(bgColor)),
        onPressed: () {},
        child: CustomText(
          text: text,
        ));
  }
}
