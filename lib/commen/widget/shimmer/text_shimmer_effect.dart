import 'package:flutter/material.dart';

import '../custom_shape/container/rounded_container.dart';
import 'shimmer_effect.dart';

class TestShimmerWidget extends StatelessWidget {
  const TestShimmerWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      height: height,
      width: width,
      radius: 3,
      child: CShimmerEffect(
        radius: 5,
        height: height,
        color: Colors.amber,
        width: width,
      ),
    );
  }
}
