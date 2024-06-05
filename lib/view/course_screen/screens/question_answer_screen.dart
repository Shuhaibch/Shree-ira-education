import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class QuestionAnswerScreen extends StatelessWidget {
  const QuestionAnswerScreen({super.key});

  final List<String> titles = const [
    "Question 01",
    "Question 02",
    "Question 03",
    "Question 04",
  ];

  final List<String> descriptions = const [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                  elevation: 2,
                  child: ExpansionTile(
                      title: CustomText(
                        text: titles[index],
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: descriptions[index],
                            ))
                      ]));
            }));
  }
}
