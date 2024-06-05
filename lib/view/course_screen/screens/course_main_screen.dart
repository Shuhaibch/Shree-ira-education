import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:shreeiraeducation/utils/buttons/custom_elevated_button.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/rating/rating_widget.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/size/constant_width/constant_width.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/course_screen/screens/practical_screen.dart';
import 'package:shreeiraeducation/view/course_screen/screens/question_answer_screen.dart';
import 'package:shreeiraeducation/view/course_screen/screens/theory_screen.dart';
import 'package:shreeiraeducation/view/course_screen/widgets/course_bottom_widget.dart';
import 'package:shreeiraeducation/view/course_screen/widgets/video_detail_widget.dart';
import 'package:shreeiraeducation/view/notification/screens/notification_screen.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  double rating = 3.5;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3, // Number of tabs
        child: SafeArea(
            child: Scaffold(
                // resizeToAvoidBottomInset: false,
                appBar: AppBar(
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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const NotificationScreen(),
                            ));
                          },
                          icon: const Icon(
                            Icons.notifications,
                            color: whiteColor,
                          ))
                    ]),
                body: Column(children: [
                  Stack(children: [
                    Container(
                        height: size.height * 0.25,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/image.png"),
                          fit: BoxFit.cover,
                        ))),
                    const VideoDetailWidget()
                  ]),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Row(children: [
                            SizedBox(
                              height: size.height * 0.05,
                              width: size.width * 0.7,
                              child: const CustomText(
                                text: "UX Design - From Wireframee to Prototype logo UX Design",
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
                          ]),
                          const KHeight(size: 0.01),
                          GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SingleChildScrollView(
                                          child: Padding(
                                              padding: const EdgeInsets.all(14.0),
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                const CustomText(
                                                  text: "Learner's Rating",
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                const KHeight(size: 0.01),
                                                Row(children: [
                                                  Column(children: [
                                                    const CustomText(
                                                      text: "4.0",
                                                      fontSize: 22,
                                                      fontWeight: FontWeight.w900,
                                                    ),
                                                    const KHeight(size: 0.01),
                                                    StarRating(
                                                      rating: 4,
                                                      allowHalfRating: false,
                                                      onRatingChanged: (rating) => setState(() => this.rating = rating),
                                                    ),
                                                    const KHeight(size: 0.01),
                                                    const CustomText(
                                                      text: "Overall rating",
                                                      color: redColor,
                                                      fontWeight: FontWeight.bold,
                                                    )
                                                  ]),
                                                  Expanded(
                                                      child: Column(children: [
                                                    SizedBox(
                                                        height: size.height * 0.005,
                                                        width: size.width * 0.25,
                                                        child: const LinearProgressIndicator(
                                                          backgroundColor: Color.fromARGB(255, 215, 212, 212),
                                                          value: 0.8,
                                                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                                                        )),
                                                    const KHeight(size: 0.02),
                                                    SizedBox(
                                                        height: size.height * 0.005,
                                                        width: size.width * 0.25,
                                                        child: const LinearProgressIndicator(
                                                          backgroundColor: Color.fromARGB(255, 215, 212, 212),
                                                          value: 0.8,
                                                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                                                        )),
                                                    const KHeight(size: 0.02),
                                                    SizedBox(
                                                      height: size.height * 0.005,
                                                      width: size.width * 0.25,
                                                      child: const LinearProgressIndicator(
                                                        backgroundColor: Color.fromARGB(255, 215, 212, 212),
                                                        value: 0.8,
                                                        valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                                                      ),
                                                    ),
                                                    const KHeight(size: 0.02),
                                                    SizedBox(
                                                      height: size.height * 0.005,
                                                      width: size.width * 0.25,
                                                      child: const LinearProgressIndicator(
                                                        backgroundColor: Color.fromARGB(255, 215, 212, 212),
                                                        value: 0.8,
                                                        valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                                                      ),
                                                    ),
                                                    const KHeight(size: 0.02),
                                                    SizedBox(
                                                        height: size.height * 0.005,
                                                        width: size.width * 0.25,
                                                        child: const LinearProgressIndicator(
                                                          backgroundColor: Color.fromARGB(255, 215, 212, 212),
                                                          value: 0.8,
                                                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                                                        ))
                                                  ])),
                                                  Column(children: [
                                                    Row(
                                                      children: [
                                                        StarRating(
                                                          rating: 4,
                                                          allowHalfRating: true,
                                                          size: 20,
                                                          onRatingChanged: (rating) => setState(() => this.rating = rating),
                                                        ),
                                                        const KWidth(size: 0.008),
                                                        const CustomText(
                                                          text: "70%",
                                                          color: greyColor,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        StarRating(
                                                          rating: 4,
                                                          allowHalfRating: true,
                                                          size: 20,
                                                          onRatingChanged: (rating) => setState(() => this.rating = rating),
                                                        ),
                                                        const KWidth(size: 0.008),
                                                        const CustomText(
                                                          text: "70%",
                                                          color: greyColor,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        StarRating(
                                                          rating: 4,
                                                          allowHalfRating: true,
                                                          size: 20,
                                                          onRatingChanged: (rating) => setState(() => this.rating = rating),
                                                        ),
                                                        const KWidth(size: 0.008),
                                                        const CustomText(
                                                          text: "70%",
                                                          color: greyColor,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(children: [
                                                      StarRating(
                                                        rating: 4,
                                                        allowHalfRating: true,
                                                        size: 20,
                                                        onRatingChanged: (rating) => setState(() => this.rating = rating),
                                                      ),
                                                      const KWidth(size: 0.008),
                                                      const CustomText(
                                                        text: "70%",
                                                        color: greyColor,
                                                      )
                                                    ]),
                                                    Row(children: [
                                                      StarRating(
                                                        rating: 4,
                                                        allowHalfRating: true,
                                                        size: 20,
                                                        onRatingChanged: (rating) => setState(() => this.rating = rating),
                                                      ),
                                                      const KWidth(size: 0.008),
                                                      const CustomText(
                                                        text: "70%",
                                                        color: greyColor,
                                                      )
                                                    ])
                                                  ])
                                                ]),
                                                const KHeight(size: 0.02),
                                                ListView.builder(
                                                    shrinkWrap: true,
                                                    physics: const NeverScrollableScrollPhysics(),
                                                    itemCount: 5,
                                                    itemBuilder: (context, index) {
                                                      return SizedBox(
                                                          height: size.height * 0.12,
                                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                            const CustomText(
                                                              text: "Vikash Chaudhary",
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                            Row(children: [
                                                              const CustomText(text: "5"),
                                                              const KWidth(size: 0.01),
                                                              StarRating(
                                                                rating: 4,
                                                                allowHalfRating: true,
                                                                size: 20,
                                                                onRatingChanged: (rating) => setState(() => this.rating = rating),
                                                              )
                                                            ]),
                                                            const CustomText(
                                                              text:
                                                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                                                              color: greyColor,
                                                            )
                                                          ]));
                                                    })
                                              ])));
                                    });
                              },
                              child: const RatingWidget(
                                mainAxisAlignment: MainAxisAlignment.end,
                                textOne: "4.0",
                                textTwo: "(125)",
                              ))
                        ])),
                    const TabBar(
                      labelColor: redColor,
                      unselectedLabelColor: greyColor,
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: redColor,
                        width: 2,
                      )),
                      tabs: [
                        Tab(text: 'Theory'),
                        Tab(text: 'Practical'),
                        Tab(text: 'Q&A'),
                      ],
                    ),
                    SizedBox(
                        height: size.height,
                        child: const TabBarView(children: [
                          TheoryScreen(),
                          PracticalScreen(),
                          QuestionAnswerScreen(),
                        ]))
                  ]))),
                  const CourseBottomWidget()
                ]))));
  }
}
