import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/helper/string_remove.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';

import '../../../utils/text/custom_text.dart';

class CoursesDescriptionCardWidget extends StatelessWidget {
  const CoursesDescriptionCardWidget({
    super.key,
    required this.size,
    required this.description,
  });

  final Size size;
  final String description;

  @override
  Widget build(BuildContext context) {
    final details = StringHelper.removeFromString(description);
    return Flexible(
      child: Card(
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
          // height: size.height * 0.21,
          width: double.infinity,
          // color: blackColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: "Description",
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                  const KHeight(size: 0.01),
                  ReadMoreText(
                    details,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
