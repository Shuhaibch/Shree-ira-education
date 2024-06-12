import 'package:flutter/material.dart';
import 'package:shreeiraeducation/models/courses/course_by_id_model.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/helper/string_remove.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/course_screen/screens/couse_change_vedio_screen.dart';
import 'package:shreeiraeducation/view/quiz/screens/online_exam_screen.dart';

class PracticalScreen extends StatelessWidget {
  const PracticalScreen({
    super.key,
    required this.course,
  });
  final CourseByIdModel course;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: course.practicals!.length,
              itemBuilder: (context, index) {
                final pratical = course.practicals![index];
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                    onTap: () {
                      if (pratical.video!.contains(course.practicals![index].video!)  ) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseChangeVedioScreen(
                                  url: pratical.video!, course: course),
                            ));
                      }
                    },
                    child: Card(
                      color: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.asset(
                              "assets/logo/logo.png",
                              height: size.height * 0.1,
                              width: size.width * 0.23,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // CRoundedImage(imageUrl: pratical.)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: StringHelper.removeFromString(
                                      pratical.title ?? "Title"),
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OnlineExamScreen(),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const CustomText(text: 'Take Quiz'),
            ),
          ),
          const KHeight(size: 0.04),
        ],
      ),
    );
  }
}
