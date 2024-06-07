import 'package:flutter/material.dart';
import 'package:shreeiraeducation/commen/widget/layout/grid_layout.dart';
import 'package:shreeiraeducation/commen/widget/shimmer/shimmer_effect.dart';

class CTopCategoryLoaderGridWidget extends StatelessWidget {
  const CTopCategoryLoaderGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 12,
      ),
      child: CGridLayout(
        itemCount: 12,
        mainAxisExtent: 90,
        itemBuilder: (_, index) => CShimmerEffect(
          height: 10,
          width: 10,
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
        ),
      ),
    );
  }
}
