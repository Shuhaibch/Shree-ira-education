import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/commen/widget/layout/grid_layout.dart';
import 'package:shreeiraeducation/commen/widget/shimmer/top_categories_loader_gridwidgett.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/home/bloc/category_bloc/category_bloc.dart';
import 'package:shreeiraeducation/view/home/widgets/outgoing_course_card_widget.dart';
import 'package:shreeiraeducation/view/home/widgets/search_widget.dart';
import 'package:shreeiraeducation/view/home/widgets/top_category_widget.dart';
import 'package:shreeiraeducation/view/home/widgets/drawer/drawer_widget.dart';
import 'package:shreeiraeducation/view/notification/screens/notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: whiteColor),
            backgroundColor: themeColor,
            title: const Center(
              child: CustomText(
                text: "Easymem",
                color: whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.notifications,
                  color: whiteColor,
                ),
              )
            ]),
        drawer: DrawerWidget(size: size),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.26,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/home.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: "Learn from Basics",
                                  color: whiteColor,
                                  fontSize: 18,
                                ),
                                CustomText(
                                  text: "Full UI/UX Designs",
                                  color: whiteColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                )
                              ],
                            ),
                            ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(themeColor),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: const CustomText(
                                text: "Know More",
                                color: whiteColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      const KHeight(size: 0.04),
                      const OutGoingCourseCardWidget(),
                      const KHeight(size: 0.02),

                      //* Top Categories

                      BlocConsumer<CategoryBloc, CategoryState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if (state is GetCategoriesLoadingState) {
                            return const CTopCategoryLoaderGridWidget();
                          }
                          if (state is GetCategoriesSuccessState) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                                bottom: 12,
                              ),
                              child: CGridLayout(
                                itemCount: state.categoryAndSubCategoryList.length,
                                mainAxisExtent: 90,
                                itemBuilder: (_, index) {
                                 
                                  return TopCategoryWidget(
                                    category:  state.categoryAndSubCategoryList[index],
                                  );
                                },
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                  const SearchWidget()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // void navigateToScreen(BuildContext context, Choice choice) {
  //   switch (choice.title) {
  //     case 'Design':
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const TopCategoryScreen()),
  //       );
  //       break;

  //     default:
  //       break;
  //   }
  // }
}


 // GridView.count(
                          //   shrinkWrap: true,
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   crossAxisCount: 2,
                          //   childAspectRatio: 1.85,
                          //   crossAxisSpacing: 14,
                          //   mainAxisSpacing: 18,
                          //   children: List.generate(
                          //     choices.length,
                          //     (index) {
                          //       return GestureDetector(
                          //         onTap: () {
                          //           navigateToScreen(context, choices[index]);
                          //         },
                          //         child: HomeGridContainerWidgeet(),
                          //       );
                          //     },
                          //   ),
                          // ),