import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(
            text: "Select Subcategories",
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
          KHeight(size: 0.02),
          CustomText(
            text: "Architecture (120)",
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
          KHeight(size: 0.02),
          CustomText(
            text: "Art History (53)",
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
          KHeight(size: 0.02),
          CustomText(
            text: "Design (174)",
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
          KHeight(size: 0.02),
          CustomText(
            text: "Fashion Design (103)",
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
          KHeight(size: 0.02),
          CustomText(
            text: "Film, Photography & Media (97)",
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
          KHeight(size: 0.02),
          CustomText(
            text: "Graphic Design (77)",
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
          KHeight(size: 0.02),
          CustomText(
            text: "Industrial Design (25)",
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
          KHeight(size: 0.02),
          CustomText(
            text: "Interior Design (18)",
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
          KHeight(size: 0.02),
        ]));
  }
}
