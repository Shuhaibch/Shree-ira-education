import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class CourseBottomWidget extends StatelessWidget {
  const CourseBottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height * 0.07,
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Container(
                  color: whiteColor,
                  width: 100,
                  child: const Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    CustomText(
                      text: "Lifetime Subscription",
                      fontSize: 10,
                    ),
                    CustomText(
                      text: "INR.2500",
                      fontWeight: FontWeight.bold,
                    )
                  ])),
              Container(
                  color: themeColor,
                  width: 290,
                  child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CustomText(
                      text: "Add To Cart",
                      // fontSize: 10,
                      color: whiteColor,
                    )
                  ]))
            ])));
  }
}
