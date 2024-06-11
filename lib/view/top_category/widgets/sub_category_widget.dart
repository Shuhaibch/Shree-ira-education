import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/models/categories/categories_model.dart';
import 'package:shreeiraeducation/models/categories/sub_category_model.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/outgoing_course/bloc/outgoingcource/outgoingcource_bloc.dart';
import 'package:shreeiraeducation/view/outgoing_course/screens/outgoing_course_screen.dart';

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({
    super.key,
    required this.subCategory,
    required this.category,
  });
  final List<SubCategory> subCategory;
  final Category category;

  @override
  Widget build(BuildContext context) {
    log(subCategory.length.toString());

    if (subCategory.isEmpty) {
      return const Center(
        child: Text('No SubCategories'),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => const KHeight(size: .01),
          itemCount: subCategory.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              context.read<OutgoingcourceBloc>().add(GetAllCourcesEvent(
                  categoryId: category.id.toString(),
                  subCategoryId: subCategory[index].id.toString()));
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return OutgoingCourseScreen( 
                       category: category,
                       subCategory: subCategory[index],
                    );
                  },
                ),
              );
            },
            child: Row(
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
        ),
      );
    }
  }
}
