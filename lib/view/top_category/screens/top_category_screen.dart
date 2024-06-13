import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/models/categories/categories_model.dart';
import 'package:shreeiraeducation/models/categories/sub_category_model.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/cart/bloc/bloc/cart_bloc.dart';
import 'package:shreeiraeducation/view/cart/screens/cart_screen.dart';
import 'package:shreeiraeducation/view/top_category/widgets/sub_category_widget.dart';

class TopCategoryScreen extends StatelessWidget {
  const TopCategoryScreen({
    super.key,
    required this.subCategoryList,
    required this.category,
  });
  final List<SubCategory> subCategoryList;
  final Category category;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: whiteColor,
              ),
            ),
            title: Center(
              child: Text(
                category.title,
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/appbar.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.transparent.withOpacity(1),
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            actions: [
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     CupertinoIcons.search,
              //     color: whiteColor,
              //   ),
              // )
              IconButton(
                onPressed: () {
                  context.read<CartBloc>().add(const GetCartCourseEvent());
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: whiteColor,
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: "Courses",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              SizedBox(
                height: size.height * 0.24,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.13,
                              width: size.width * 0.42,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14.0),
                                child: Image.asset(
                                  "assets/images/grid.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const KHeight(size: 0.01),
                            SizedBox(
                              width: size.width * 0.4,
                              child: const CustomText(
                                text:
                                    "UX Design - From Wireframe to Prototype logo",
                                // color: whiteColor,
                                fontWeight: FontWeight.bold,
                                maxLines: 2,
                              ),
                            ),
                            const CustomText(
                              text: "Sam Smith",
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                  ),
                  itemCount: 3,
                ),
              ),
              const Divider(
                thickness: 6,
                color: Color.fromARGB(255, 234, 226, 226),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomText(
                  text: "Select Subcategories",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const KHeight(size: 0.02),
              SizedBox(
                width: double.infinity,
                height: size.height * .5,
                child: SubCategoryWidget(
                  subCategory: subCategoryList,
                  category: category,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
