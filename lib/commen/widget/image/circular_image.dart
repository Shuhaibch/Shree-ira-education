import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shreeiraeducation/commen/widget/shimmer/shimmer_effect.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';

class CRoundedImage extends StatelessWidget {
  const CRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.backgroundColor = whiteColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.border,
    this.borderRadius = 16,
  });
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final Color? backgroundColor;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final double borderRadius;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border, borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: fit,
                  progressIndicatorBuilder: (context, url, progress) =>
                      CShimmerEffect(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    width: width ?? double.infinity,
                    height: height ?? 158,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: AssetImage(imageUrl),
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
