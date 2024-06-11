import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/course_screen/widgets/course_description_widget.dart';

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
          // Card(
          //   shape: const RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(
          //     Radius.circular(12),
          //   )),
          //   elevation: 2,
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       borderRadius: BorderRadius.all(
          //         Radius.circular(12),
          //       ),
          //     ),
          //     height: size.height * 0.17,
          //     width: double.infinity,
          //     // color: blackColor,
          //     child: const Padding(
          //       padding: EdgeInsets.all(10.0),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           CustomText(
          //             text: "Course Brief",
          //             fontWeight: FontWeight.w500,
          //             color: blackColor,
          //           ),
          //           Padding(
          //             padding: EdgeInsets.all(8.0),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Column(
          //                   children: [
          //                     CourseBriefWidget(
          //                       textOne: "Total Timing",
          //                       textTwo: "36 Hours",
          //                       icon: Icons.timelapse_outlined,
          //                     ),
          //                     KHeight(size: 0.03),
          //                     CourseBriefWidget(
          //                       textOne: "Accessibility",
          //                       textTwo: "Lifetime",
          //                       icon: Icons.verified_user_rounded,
          //                     ),
          //                   ],
          //                 ),
          //                 Spacer(),
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     CourseBriefWidget(
          //                       textOne: "Total Videos",
          //                       textTwo: "36 Lectures",
          //                       icon: Icons.live_tv_sharp,
          //                     ),
          //                     KHeight(size: 0.03),
          //                     CourseBriefWidget(
          //                       textOne: "Course Uploaded",
          //                       textTwo: "20th Mar 2023",
          //                       icon: Icons.event,
          //                     ),
          //                   ],
          //                 )
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // const KHeight(size: 0.02),
          CoursesDescriptionCardWidget(size: size),
          const KHeight(size: 0.02),
          // CourseCreatedByWidget(size: size),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              separatorBuilder: (context, index) => const KHeight(size: .01),
              itemBuilder: (context, index) {
                return const CoursesExpandedConatinerWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CoursesExpandedConatinerWidget extends StatelessWidget {
  const CoursesExpandedConatinerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      elevation: 2,
      child: ExpansionTile(
        title: CustomText(
          text: "Title",
          color: blackColor,
          fontWeight: FontWeight.bold,
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15, bottom: 15),
                child: CustomText(
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 20, bottom: 15),
                child: CustomText(
                  text: 'Download Pdf',
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
