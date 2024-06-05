import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/course_screen/screens/course_main_screen.dart';
import 'package:shreeiraeducation/view/outgoing_course/widgets/filter_drawer_widget.dart';

class OutgoingCourseScreen extends StatelessWidget {
  OutgoingCourseScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            endDrawer: const Drawer(child: FilterDrawerWidget()),
            appBar: AppBar(
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: whiteColor,
                  ),
                ),
                backgroundColor: themeColor,
                title: const CustomText(
                  text: "Course",
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                      icon: const Icon(
                        Icons.filter_list_outlined,
                        color: whiteColor,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.search,
                        color: whiteColor,
                      ))
                ]),
            body: SingleChildScrollView(
                child: Stack(children: [
              Container(
                color: themeColor,
                height: size.height * 0.09,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: List.generate(
                        8,
                        (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const CourseScreen(),
                                  ));
                                },
                                child: Stack(children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                    Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        child: SizedBox(
                                            height: size.height * 0.13,
                                            width: size.width * 0.80,
                                            child: const Padding(
                                                padding: EdgeInsets.only(
                                                  right: 8,
                                                  top: 8,
                                                  bottom: 8,
                                                  left: 90,
                                                ),
                                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                                                  CustomText(
                                                    text: "UX Design - From Wireframe to Prototype logo UX Design",
                                                    maxLines: 2,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  KHeight(size: 0.01),
                                                  CustomText(
                                                    text: "Sam Smith",
                                                    fontSize: 12,
                                                  )
                                                ]))))
                                  ]),
                                  Positioned(
                                    left: 4,
                                    top: 13,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Image.asset(
                                          "assets/images/home.png",
                                          height: size.height * 0.11,
                                          width: size.width * 0.26,
                                          fit: BoxFit.cover,
                                        )),
                                  )
                                ]))))),
              )
            ]))));
  }
}
