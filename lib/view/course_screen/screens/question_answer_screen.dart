import 'package:flutter/material.dart';
import 'package:shreeiraeducation/models/courses/course_by_id_model.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/helper/string_remove.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class QuestionAnswerScreen extends StatelessWidget {
  const QuestionAnswerScreen({super.key, required this.course});
  final CourseByIdModel course;

  @override
  Widget build(BuildContext context) {
    return course.questionAnswers!.isEmpty || course.questionAnswers == null
        ? const Center(
            child: Text(
              'No Q&A',
              style: TextStyle(color: Colors.black),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: course.questionAnswers!.length,
              itemBuilder: (context, index) {
                final question = course.questionAnswers![index];

                return Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  elevation: 2,
                  child: ExpansionTile(
                    title: CustomText(
                      text: StringHelper.removeFromString(
                          question.title ?? 'Title'),
                      color: blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, right: 18.0, bottom: 10),
                        child: CustomText(
                          text: StringHelper.removeFromString(
                              question.detail ?? 'Description'),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
  }
}
