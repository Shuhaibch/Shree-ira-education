import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/outgoing_course/screens/outgoing_course_screen.dart';

class OutGoingCourseCardWidget extends StatelessWidget {
  const OutGoingCourseCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [
          const KHeight(size: 0.01),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const CustomText(
              text: "Outgoing Course",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OutgoingCourseScreen(),
                  ));
                },
                child: const CustomText(
                  text: "View all",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: redColor,
                ))
          ]),
          const KHeight(size: 0.01),
          Card(
              color: whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(22.0),
                    child: Image.asset(
                      "assets/images/home.png",
                      height: size.height * 0.12,
                      width: size.width * 0.22,
                      fit: BoxFit.cover,
                    )),
                Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      SizedBox(
                        width: size.width * 0.58,
                        child: const CustomText(
                          text: "UX Design - From Wireframe to Prototype logo UX Design",
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CustomText(
                        text: "Sam Smith",
                        fontSize: 13,
                        color: Color.fromARGB(255, 130, 129, 129),
                      ),
                      const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        CustomText(
                          text: "35% Completed",
                          color: redColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )
                      ])
                    ]))
              ])),
          const KHeight(size: 0.02),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const CustomText(
              text: "Top Categories",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            GestureDetector(
              onTap: () {},
              child: const CustomText(
                text: "View all",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: redColor,
              ),
            )
          ])
        ]));
  }
}
