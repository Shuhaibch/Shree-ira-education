import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_width/constant_width.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class CourseBriefWidget extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final IconData icon;
  const CourseBriefWidget({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: redColor,
        ),
        const KWidth(size: 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: textOne,
              color: greyColor,
            ),
            CustomText(
              text: textTwo,
              fontWeight: FontWeight.bold,
            ),
          ],
        )
      ],
    );
  }
}
