import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';

class CShimmerEffect extends StatelessWidget {
  const CShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });
  final double width, height, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(148, 255, 255, 253),
      highlightColor: const Color.fromARGB(255, 233, 225, 162),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: (whiteColor), borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
