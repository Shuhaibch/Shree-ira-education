import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/commen/widget/image/circular_image.dart';
import 'package:shreeiraeducation/models/courses/courses_model.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/course_screen/bloc/course_by_id/course_by_id_bloc.dart';
import 'package:shreeiraeducation/view/course_screen/screens/course_main_screen.dart';

class OutGoingCourseListWidget extends StatelessWidget {
  const OutGoingCourseListWidget({
    super.key,
    required this.size,
    required this.course,
  });

  final Size size;
  final List<Course> course;

  @override
  Widget build(BuildContext context) {
    return course.isEmpty
        ? const Center(
            child: Text('No Courses found'),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(
                course.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      context.read<CourseByIdBloc>().add(GetCourseByIdEvent(
                          courseId: course[index].id.toString()));
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CourseScreen(),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: SizedBox(
                                height: size.height * 0.13,
                                width: size.width * 0.80,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8,
                                    top: 8,
                                    bottom: 8,
                                    left: 90,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: course[index].title,
                                        maxLines: 2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const KHeight(size: 0.01),
                                      course[index].price != null
                                          ? Text(
                                              'INR. ${course[index].price}',
                                              style: const TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationColor: Colors.red,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : const KHeight(size: 0.02),
                                      const KHeight(size: 0.01),
                                      course[index].discountPrice != null
                                          ? Text(
                                              'INR. ${course[index].discountPrice}',
                                              style: const TextStyle(
                                                  // decoration: TextDecoration.lineThrough,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )
                                          : const CustomText(text: 'Free')
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          left: 4,
                          top: 13,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: CRoundedImage(
                              imageUrl:
                                  'http://axnoldigitalsolutions.in/Training/images/course/${course[index].previewImage}',
                              height: size.height * 0.11,
                              width: size.width * 0.26,
                              isNetworkImage: true,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
