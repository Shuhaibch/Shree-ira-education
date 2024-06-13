import 'package:flutter/material.dart';
import 'package:shreeiraeducation/commen/widget/image/circular_image.dart';
import 'package:shreeiraeducation/models/courses/my_enrolled_course.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/size/constant_width/constant_width.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class CourseDetailCardWidget extends StatelessWidget {
  const CourseDetailCardWidget({
    super.key,
    required this.enrollDetail,
  });
  final EnrollDetail enrollDetail;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      elevation: 6,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: whiteColor,
        ),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: CRoundedImage(
                  imageUrl: "http://axnoldigitalsolutions.in/Training/images/course/${enrollDetail.course!.previewImage}" ,
                  isNetworkImage: true,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: enrollDetail.course!.title ?? 'Title',
                    maxLines: 2,
                    fontWeight: FontWeight.bold,
                  ),
                  const KHeight(size: 0.02),
                  Row(
                    children: [
                      Container(
                        height: size.height * 0.02,
                        width: size.width * 0.08,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 121, 253, 20),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: const Center(
                          child: CustomText(
                            text: "4.0",
                            color: whiteColor,
                          ),
                        ),
                      ),
                      const KWidth(size: 0.02),
                      const CustomText(
                        text: "(125)",
                        color: blackColor,
                      )
                    ],
                  ),
                  const KHeight(size: 0.02),
                  SizedBox(
                    height: size.height * 0.005,
                    // width: size.width * 0.25,
                    child: const LinearProgressIndicator(
                      backgroundColor: Color.fromARGB(255, 215, 212, 212),
                      value: 0.8,
                      valueColor: AlwaysStoppedAnimation<Color>(redColor),
                    ),
                  ),
                  const KHeight(size: 0.01),
                  const CustomText(
                    text: "75% Completed",
                    color: redColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
