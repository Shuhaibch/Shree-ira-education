import 'package:flutter/material.dart';
import 'package:shreeiraeducation/models/courses/course_by_id_model.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class CourseBottomWidget extends StatelessWidget {
  const CourseBottomWidget({
    super.key,
    required this.course,
  });
  final CourseByIdModel course;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.07,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: themeColor,
          width: double.infinity,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Enroll Course",
                // fontSize: 10,
                color: whiteColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
// Container(
//                 color: whiteColor,
//                 width: 100,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const CustomText(
//                       text: "Lifetime Subscription",
//                       fontSize: 10,
//                     ),
//                     CustomText(
//                       text: course.price == null
//                           ? "Free"
//                           : "INR.${course.price == null}",
//                       fontWeight: FontWeight.bold,
//                     )
//                   ],
//                 ),
//               ),