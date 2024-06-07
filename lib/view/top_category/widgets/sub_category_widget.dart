import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shreeiraeducation/models/categories/sub_category_model.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({
    super.key,
    required this.subCategory,
  });
  final List<SubCategory> subCategory;

  @override
  Widget build(BuildContext context) {
    log(subCategory.length.toString());

    return subCategory.isEmpty
        ? const Center(
            child: Text('No SubCategories'),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              separatorBuilder: (context, index) => const KHeight(size: .01),
              itemCount: subCategory.length,
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: subCategory[index].title,
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                  CustomText(
                    text: ' (${subCategory[index].coursesCount})',
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    fontSize: 19,
                  ),
                ],
              ),
            ),
          );
  }
}
