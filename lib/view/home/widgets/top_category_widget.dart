import 'package:flutter/material.dart';
import 'package:shreeiraeducation/commen/widget/image/circular_image.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/home/bloc/category_bloc/category_bloc.dart';
import 'package:shreeiraeducation/view/top_category/screens/top_category_screen.dart';

class TopCategoryWidget extends StatelessWidget {
  const TopCategoryWidget({
    super.key,
    required this.category,
  });
  final CategoryAndSubCategory category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TopCategoryScreen(
              subCategoryList: category.subCategory,
              category: category.category),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: CRoundedImage(
                    imageUrl:
                        'http://axnoldigitalsolutions.in/Training/images/category/${category.category.catImage}',
                    isNetworkImage: true,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      color: Colors.black.withOpacity(
                        0.5,
                      ), // Adjust opacity as needed
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: 40,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: category.category.title,
                    color: Colors.white,
                  ),
                  CustomText(
                    text:
                        '${CategoryAndSubCategory.courseCount(category.subCategory)} courses',
                    fontSize: 12,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
