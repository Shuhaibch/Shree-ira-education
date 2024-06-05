import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/rating/rating_widget.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/size/constant_width/constant_width.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/course_screen/widgets/course_brief_widget.dart';

class TheoryScreen extends StatelessWidget {
  const TheoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
            elevation: 2,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                Radius.circular(12),
              )),
              height: size.height * 0.17,
              width: double.infinity,
              // color: blackColor,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Course Brief",
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CourseBriefWidget(
                                textOne: "Total Timing",
                                textTwo: "36 Hours",
                                icon: Icons.timelapse_outlined,
                              ),
                              KHeight(size: 0.03),
                              CourseBriefWidget(
                                textOne: "Accessibility",
                                textTwo: "Lifetime",
                                icon: Icons.verified_user_rounded,
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CourseBriefWidget(
                                textOne: "Total Videos",
                                textTwo: "36 Lectures",
                                icon: Icons.live_tv_sharp,
                              ),
                              KHeight(size: 0.03),
                              CourseBriefWidget(
                                textOne: "Course Uploaded",
                                textTwo: "20th Mar 2023",
                                icon: Icons.event,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const KHeight(size: 0.02),
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
            elevation: 2,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                Radius.circular(12),
              )),
              height: size.height * 0.2,
              width: double.infinity,
              // color: blackColor,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Description",
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                    KHeight(size: 0.01),
                    CustomText(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                      color: Color.fromARGB(255, 79, 78, 78),
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
              ),
            ),
          ),
          const KHeight(size: 0.02),
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
            elevation: 2,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                Radius.circular(12),
              )),
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
                          backgroundImage: AssetImage("assets/images/profile.png"),
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
                            RatingWidget(mainAxisAlignment: MainAxisAlignment.start, textOne: "4.0", textTwo: "(772)"),
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
          ),
        ],
      ),
    );
  }
}
