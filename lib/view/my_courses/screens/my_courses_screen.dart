import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/my_courses/widgets/course_detail_card_widget.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 2;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                iconTheme: const IconThemeData(color: whiteColor),
                backgroundColor: themeColor,
                title: const CustomText(
                  text: "My Courses",
                  color: whiteColor,
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: whiteColor,
                      ))
                ]),
            body: Stack(children: [
              Container(
                color: themeColor,
                height: size.height * 0.09,
              ),
              SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 14.0,
                            childAspectRatio: (itemWidth / itemHeight),
                          ),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return const CourseDetailCardWidget();
                          })))
            ])));
  }
}
