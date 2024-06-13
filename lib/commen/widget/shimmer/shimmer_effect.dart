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
    // this.baseColor = const Color.fromARGB(148, 255, 255, 253),
    this.baseColor = const Color.fromARGB(255, 224, 224, 224),
    this.highlightColor = const Color.fromARGB(251, 245, 245, 245),
    // this.highlightColor = const Color.fromARGB(255, 233, 225, 162),
  });
  final double width, height, radius;
  final Color? color, baseColor, highlightColor;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor!,
      highlightColor: highlightColor!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: (whiteColor), borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
