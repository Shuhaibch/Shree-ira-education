import 'package:flutter/material.dart';
import 'package:shreeiraeducation/commen/widget/shimmer/shimmer_effect.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';

class OutGoingCourseListLoadingWidget extends StatelessWidget {
  const OutGoingCourseListLoadingWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: List.generate(
          8,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SizedBox(
                        height: size.height * 0.13,
                        width: size.width * 0.80,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 8,
                            top: 8,
                            bottom: 8,
                            left: 90,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CShimmerEffect(
                                width: size.width * .4,
                                height: size.height * .03,
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                              ),
                              const KHeight(size: 0.01),
                              CShimmerEffect(
                                width: size.width * .4,
                                height: size.height * .03,
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                              ),
                              const KHeight(size: 0.01),
                              CShimmerEffect(
                                width: size.width * .4,
                                height: size.height * .02,
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  left: 4,
                  top: 13,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: SizedBox(
                      height: size.height * 0.11,
                      width: size.width * 0.26,
                      child: CShimmerEffect(
                        height: size.height * 0.11,
                        width: size.width * 0.26,
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
