import 'package:flutter/material.dart';
import 'package:shreeiraeducation/commen/widget/shimmer/shimmer_effect.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/size/constant_width/constant_width.dart';

class CourseDetailLoadingCardWidget extends StatelessWidget {
  const CourseDetailLoadingCardWidget({
    super.key,
  });

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
            const Expanded(
              child: SizedBox(
                width: double.infinity,
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage(
                //       "assets/images/home.png",
                //     ),
                //     fit: BoxFit.cover,
                //   ),
                // ),
                child: CShimmerEffect(width: 40, height: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CShimmerEffect(
                      width: size.width * .38, height: size.height * .01),
                  const KHeight(size: 0.01),
                  CShimmerEffect(
                      width: size.width * .38, height: size.height * .01),
                  const KHeight(size: 0.02),
                  Row(
                    children: [
                      CShimmerEffect(
                          width: size.width * .1, height: size.height * .01),
                      const KWidth(size: 0.02),
                      CShimmerEffect(
                          width: size.width * .1, height: size.height * .01),
                    ],
                  ),
                  const KHeight(size: 0.02),
                  CShimmerEffect(
                      width: size.width * .35, height: size.height * .01),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
