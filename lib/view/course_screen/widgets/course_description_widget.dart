
import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';

import '../../../utils/text/custom_text.dart';

class CoursesDescriptionCardWidget extends StatelessWidget {
  const CoursesDescriptionCardWidget({
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
                text: "Description",
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
              KHeight(size: 0.01),
              CustomText(
                maxLines: 7,
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchangeddffd",
                color: Color.fromARGB(255, 79, 78, 78),
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
