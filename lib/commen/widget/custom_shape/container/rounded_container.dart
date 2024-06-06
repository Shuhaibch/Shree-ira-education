
import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';

class CRoundedContainer extends StatelessWidget {
  const CRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = 16,
    this.child,
    this.showBorder = false,
    this.borderColor = Colors.grey,
    this.backgroundColor = whiteColor,
    this.padding,
    this.margin,
  });
  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder? Border.all(color: borderColor):null,
      ),
      child: child,
    );
  }
}
