import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/commen/widget/image/circular_image.dart';
import 'package:shreeiraeducation/models/courses/course_by_id_model.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/rating/rating_widget.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/cart/screens/cart_screen.dart';
import 'package:shreeiraeducation/view/course_screen/screens/practical_screen.dart';
import 'package:shreeiraeducation/view/course_screen/screens/question_answer_screen.dart';
import 'package:shreeiraeducation/view/course_screen/screens/theory_screen.dart';
import 'package:shreeiraeducation/view/course_screen/widgets/courses_rating_bottom_sheet.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../utils/snack_bar/snackbar.dart';
import '../../cart/bloc/bloc/cart_bloc.dart';

class CourseMainScreenWidget extends StatelessWidget {
  const CourseMainScreenWidget({
    super.key,
    required this.size,
    required YoutubePlayerController controller,
    this.isImage = false,
    required this.course,
  }) : _controller = controller;

  final Size size;
  final YoutubePlayerController _controller;
  final bool isImage;
  final CourseByIdModel course;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Stack(
        //   children: [
        //     Container(
        //       height: size.height * 0.25,
        //       width: double.infinity,
        //       decoration: const BoxDecoration(
        //         image: DecorationImage(
        //           image: AssetImage("assets/images/image.png"),
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     ),
        //     const VideoDetailWidget()
        //   ],
        // ),
        isImage
            ? CRoundedImage(
                height: size.height * 0.25,
                width: double.infinity,
                imageUrl: course.previewImage!,
                isNetworkImage: true,
              )
            : Builder(
                builder: (context) {
                  return YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent,
                    ),
                    onReady: () {
                      // _controller.addListener(listener);
                    },
                  );
                },
              ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: size.height * 0.05,
                            width: size.width * 0.7,
                            child: CustomText(
                              text: course.title!,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          // const CustomElevatedButton(
                          //   text: "Enroll Now",
                          //   bgColor: themeColor,
                          // )
                          course.type == '0'
                              ? const SizedBox()
                              : BlocConsumer<CartBloc, CartState>(
                                  listener: (context, state) {
                                    if (state is AddCartSuccessState) {
                                      // controller.dispose();
                                      CSnackBar.showSuccessSnackBar(
                                          context, 'Course added To cart');
                                      context
                                          .read<CartBloc>()
                                          .add(const GetCartCourseEvent());
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CartScreen(),
                                        ),
                                      );
                                    }
                                    if (state is AddCartAlreadyInCartState) {
                                      CSnackBar.showSnackBar(
                                          context, state.msg);
                                    }
                                    if (state is AddCartFailedState) {
                                      CSnackBar.showErrorSnackBar(
                                          context, 'Try Again');
                                    }
                                  },
                                  builder: (context, state) {
                                    return ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  themeColor)),
                                      onPressed: () {
                                        log('message');
                                        log(course.id.toString());
                                        context.read<CartBloc>().add(
                                            AddToCartEvent(
                                                courseId:
                                                    course.id.toString()));
                                      },
                                      child: const CustomText(
                                        text: "Enroll Now",
                                      ),
                                    );
                                  },
                                )
                        ],
                      ),
                      const KHeight(size: 0.01),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return const CoursesRatingBottomSheet();
                            },
                          );
                        },
                        child: const RatingWidget(
                          mainAxisAlignment: MainAxisAlignment.end,
                          textOne: "4.0",
                          textTwo: "(125)",
                        ),
                      )
                    ],
                  ),
                ),
                const TabBar(
                  labelColor: redColor,
                  unselectedLabelColor: greyColor,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: redColor,
                      width: 2,
                    ),
                  ),
                  tabs: [
                    Tab(text: 'Theory'),
                    Tab(text: 'Practical'),
                    Tab(text: 'Q&A'),
                  ],
                ),
                SizedBox(
                  height: size.height,
                  child: TabBarView(
                    children: [
                      TheoryScreen(
                        course: course,
                      ),
                      PracticalScreen(
                        course: course,
                      ),
                      QuestionAnswerScreen(
                        course: course,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
       
      ],
    );
  }
}
// const CustomElevatedButton(
//                             text: "Enroll Now",
//                             bgColor: themeColor,
//                           )