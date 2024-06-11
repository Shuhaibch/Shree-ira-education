import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/rating/rating_widget.dart';
import 'package:shreeiraeducation/utils/size/constant_width/constant_width.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

import '../../../utils/size/constant_height/constant_height.dart';

class CourseCreatedByWidget extends StatelessWidget {
  const CourseCreatedByWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      elevation: 2,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        height: size.height * 0.2,
        width: double.infinity,
        // color: blackColor,
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Created by",
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
              KHeight(size: 0.01),
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage:
                        AssetImage("assets/images/profile.png"),
                  ),
                  KWidth(size: 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Jerry George",
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: "New Jersey",
                        color: greyColor,
                      )
                    ],
                  ),
                  Spacer(),
                  CustomText(
                    text: "View Profile",
                    color: redColor,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
              KHeight(size: 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "886",
                        fontWeight: FontWeight.bold,
                      ),
                      KHeight(size: 0.005),
                      CustomText(
                        text: "Subscribed",
                        color: greyColor,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "39",
                        fontWeight: FontWeight.bold,
                      ),
                      KHeight(size: 0.005),
                      CustomText(
                        text: "Courses",
                        color: greyColor,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingWidget(
                          mainAxisAlignment: MainAxisAlignment.start,
                          textOne: "4.0",
                          textTwo: "(772)"),
                      KHeight(size: 0.005),
                      CustomText(
                        text: "Avg. Rating",
                        color: greyColor,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
