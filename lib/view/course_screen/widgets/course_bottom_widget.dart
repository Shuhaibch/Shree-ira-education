import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/models/courses/course_by_id_model.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/snack_bar/snackbar.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/cart/bloc/bloc/cart_bloc.dart';
import 'package:shreeiraeducation/view/cart/screens/cart_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseBottomWidget extends StatelessWidget {
  const CourseBottomWidget({
    super.key,
    required this.course,
    required this.controller,
  });
  final CourseByIdModel course;
  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is AddCartSuccessState) {
          controller.dispose();
          CSnackBar.showSuccessSnackBar(context, 'Course added To cart');
          context.read<CartBloc>().add(const GetCartCourseEvent());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          );
        }
        if (state is AddCartAlreadyInCartState) {
          CSnackBar.showSnackBar(context, state.msg);
        }
        if (state is AddCartFailedState) {
          CSnackBar.showErrorSnackBar(context, 'Try Again');
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            log(course.id.toString());
            context
                .read<CartBloc>()
                .add(AddToCartEvent(courseId: course.id.toString()));
          },
          child: SizedBox(
            height: size.height * 0.07,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: themeColor,
                width: double.infinity,
                child: state is AddCartLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Center(
                        child: CustomText(
                          text: "Enroll Course",
                          // fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
// Container(
//                 color: whiteColor,
//                 width: 100,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const CustomText(
//                       text: "Lifetime Subscription",
//                       fontSize: 10,
//                     ),
//                     CustomText(
//                       text: course.price == null
//                           ? "Free"
//                           : "INR.${course.price == null}",
//                       fontWeight: FontWeight.bold,
//                     )
//                   ],
//                 ),
//               ),