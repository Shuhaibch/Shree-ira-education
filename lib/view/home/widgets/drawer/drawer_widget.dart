import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/authentication/bloc/authentication_bloc.dart';
import 'package:shreeiraeducation/view/authentication/screens/login_screen.dart';
import 'package:shreeiraeducation/view/edit_profile/screens/edit_profile_screen.dart';
import 'package:shreeiraeducation/view/home/screens/home_screen.dart';
import 'package:shreeiraeducation/view/home/widgets/drawer/bloc/user/user_bloc.dart';
import 'package:shreeiraeducation/view/home/widgets/drawer/terms_condition/privacy_policy_screen.dart';
import 'package:shreeiraeducation/view/home/widgets/drawer/terms_condition/terms_condition_screen.dart';
import 'package:shreeiraeducation/view/my_courses/screens/my_courses_screen.dart';

import '../../../../models/user/user_model.dart';
import 'drawer_header_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   BlocProvider.of<UserBloc>(context).add(GetUserDetailsEvent());
    // });
    User? user;
    return Drawer(
      surfaceTintColor: whiteColor,
      child: ListView(
        children: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is GetUserDetailsLoadingState) {
                return const DrawerHeaderLoadingWidget();
              }
              if (state is GetUserDetailsSuccessState) {
                user = state.user;
                return DrawerHeaderWidget(user: user!);
              }
              return const DrawerHeaderLoadingWidget();
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const HomeScreen(),
                  //   ),
                  // );
                },
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
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyCoursesScreen(),
                    ),
                  );
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
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => const CartScreen(),
              //       ),
              //     );
              //   },
              //   child: const ListTile(
              //     leading: Icon(
              //       Icons.privacy_tip_outlined,
              //       size: 26,
              //       color: greyColor,
              //     ),
              //     title: CustomText(
              //       text: "Purchased Courses",
              //       color: greyColor,
              //       fontSize: 18,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  if (user != null) {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(
                          user: user!,
                        ),
                      ),
                    );
                  }
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.settings_outlined,
                    color: greyColor,
                    size: 26,
                  ),
                  title: CustomText(
                    text: "Profile",
                    color: greyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TermsConditionScreen(),
                    ),
                  );
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    size: 26,
                    color: greyColor,
                  ),
                  title: CustomText(
                    text: "Terms & Conditions",
                    color: greyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen(),
                    ),
                  );
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.privacy_tip,
                    size: 26,
                    color: greyColor,
                  ),
                  title: CustomText(
                    text: "Privacy & Policy",
                    color: greyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is UserLogOutSuccess) {
                    Future.delayed(
                      const Duration(milliseconds: 10),
                      () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);

                      context.read<AuthenticationBloc>().add(UserLogOutEvent());
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.login_outlined,
                        size: 26,
                        color: greyColor,
                      ),
                      title: CustomText(
                        text: "Log Out",
                        color: greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
