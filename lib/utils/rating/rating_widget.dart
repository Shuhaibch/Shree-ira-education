import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class RatingWidget extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final String textOne;
  final String textTwo;

  const RatingWidget({
    super.key,
    required this.mainAxisAlignment,
    required this.textOne,
    required this.textTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color.fromRGBO(128, 209, 56, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              )),
          child: Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
            child: CustomText(
              text: textOne,
              color: whiteColor,
              fontSize: 10,
            ),
          ),
        ),
        CustomText(text: textTwo)
      ],
    );
  }
}
