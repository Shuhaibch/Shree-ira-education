
import 'package:flutter/material.dart';
import 'package:shreeiraeducation/commen/widget/image/circular_image.dart';
import 'package:shreeiraeducation/models/courses/course_by_id_model.dart';
import 'package:shreeiraeducation/utils/buttons/custom_elevated_button.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/rating/rating_widget.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/course_screen/screens/practical_screen.dart';
import 'package:shreeiraeducation/view/course_screen/screens/question_answer_screen.dart';
import 'package:shreeiraeducation/view/course_screen/screens/theory_screen.dart';
import 'package:shreeiraeducation/view/course_screen/widgets/course_bottom_widget.dart';
import 'package:shreeiraeducation/view/course_screen/widgets/courses_rating_bottom_sheet.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
            : Builder(builder: (context) {
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
              }),
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
                          const CustomElevatedButton(
                            text: "Enroll Now",
                            bgColor: themeColor,
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
        CourseBottomWidget(course: course , controller: _controller,)
      ],
    );
  }
}
