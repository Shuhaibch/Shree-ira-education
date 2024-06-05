// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/cart/screens/cart_screen.dart';
import 'package:shreeiraeducation/view/edit_profile/screens/edit_profile_screen.dart';
import 'package:shreeiraeducation/view/my_courses/screens/my_courses_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        surfaceTintColor: whiteColor,
        child: ListView(children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: themeColor),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      const CircleAvatar(
                        radius: 38,
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                      ),
                      Positioned(
                        bottom: -12,
                        right: 0,
                        left: 50,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EditProfileScreen(),
                            ));
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: whiteColor,
                            size: 20,
                          ),
                        ),
                      )
                    ]),
                    const KHeight(size: 0.01),
                    const CustomText(
                      text: "Solarc",
                      fontSize: 16,
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                    const CustomText(
                      text: "yourname@gmail.com",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    )
                  ])),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            GestureDetector(
                onTap: () {},
                child: const ListTile(
                    leading: Icon(
                      CupertinoIcons.search,
                      size: 26,
                      color: redColor,
                    ),
                    title: CustomText(
                      text: "Search Courses",
                      color: redColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ))),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyCoursesScreen(),
                  ));
                },
                child: const ListTile(
                    leading: Icon(
                      Icons.my_library_books_outlined,
                      size: 26,
                      color: greyColor,
                    ),
                    title: CustomText(
                      text: "My Courses",
                      color: greyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ))),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ));
                },
                child: const ListTile(
                    leading: Icon(
                      Icons.privacy_tip_outlined,
                      size: 26,
                      color: greyColor,
                    ),
                    title: CustomText(
                      text: "Purchased Courses",
                      color: greyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ))),
            GestureDetector(
                onTap: () {},
                child: const ListTile(
                    leading: Icon(
                      Icons.settings_outlined,
                      color: greyColor,
                      size: 26,
                    ),
                    title: CustomText(
                      text: "Settings",
                      color: greyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ))),
            GestureDetector(
                onTap: () {},
                child: const ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      size: 26,
                      color: greyColor,
                    ),
                    title: CustomText(
                      text: "About Us",
                      color: greyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )))
          ])
        ]));
  }
}
