import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/size/constant_width/constant_width.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class CoursesRatingBottomSheet extends StatefulWidget {
  const CoursesRatingBottomSheet({super.key});

  @override
  State<CoursesRatingBottomSheet> createState() =>
      _CoursesRatingBottomSheetState();
}

class _CoursesRatingBottomSheetState extends State<CoursesRatingBottomSheet> {
  double rating = 3.5;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Learner's Rating",
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            const KHeight(size: 0.01),
            Row(
              children: [
                Column(
                  children: [
                    const CustomText(
                      text: "4.0",
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                    const KHeight(size: 0.01),
                    StarRating(
                      rating: 4,
                      allowHalfRating: false,
                      onRatingChanged: (rating) =>
                          setState(() => this.rating = rating),
                    ),
                    const KHeight(size: 0.01),
                    const CustomText(
                      text: "Overall rating",
                      color: redColor,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.005,
                        width: size.width * 0.25,
                        child: const LinearProgressIndicator(
                          backgroundColor: Color.fromARGB(
                            255,
                            215,
                            212,
                            212,
                          ),
                          value: 0.8,
                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                        ),
                      ),
                      const KHeight(size: 0.02),
                      SizedBox(
                        height: size.height * 0.005,
                        width: size.width * 0.25,
                        child: const LinearProgressIndicator(
                          backgroundColor: Color.fromARGB(
                            255,
                            215,
                            212,
                            212,
                          ),
                          value: 0.8,
                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                        ),
                      ),
                      const KHeight(size: 0.02),
                      SizedBox(
                        height: size.height * 0.005,
                        width: size.width * 0.25,
                        child: const LinearProgressIndicator(
                          backgroundColor: Color.fromARGB(
                            255,
                            215,
                            212,
                            212,
                          ),
                          value: 0.8,
                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                        ),
                      ),
                      const KHeight(size: 0.02),
                      SizedBox(
                        height: size.height * 0.005,
                        width: size.width * 0.25,
                        child: const LinearProgressIndicator(
                          backgroundColor: Color.fromARGB(
                            255,
                            215,
                            212,
                            212,
                          ),
                          value: 0.8,
                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                        ),
                      ),
                      const KHeight(size: 0.02),
                      SizedBox(
                        height: size.height * 0.005,
                        width: size.width * 0.25,
                        child: const LinearProgressIndicator(
                          backgroundColor: Color.fromARGB(
                            255,
                            215,
                            212,
                            212,
                          ),
                          value: 0.8,
                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        StarRating(
                          rating: 4,
                          allowHalfRating: true,
                          size: 20,
                          onRatingChanged: (rating) =>
                              setState(() => this.rating = rating),
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
                          onRatingChanged: (rating) =>
                              setState(() => this.rating = rating),
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
                          onRatingChanged: (rating) =>
                              setState(() => this.rating = rating),
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
                          onRatingChanged: (rating) =>
                              setState(() => this.rating = rating),
                        ),
                        const KWidth(size: 0.008),
                        const CustomText(
                          text: "70%",
                          color: greyColor,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        StarRating(
                          rating: 4,
                          allowHalfRating: true,
                          size: 20,
                          onRatingChanged: (rating) =>
                              setState(() => this.rating = rating),
                        ),
                        const KWidth(size: 0.008),
                        const CustomText(
                          text: "70%",
                          color: greyColor,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const KHeight(size: 0.02),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: size.height * 0.12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: "Vikash Chaudhary",
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          const CustomText(text: "5"),
                          const KWidth(size: 0.01),
                          StarRating(
                            rating: 4,
                            allowHalfRating: true,
                            size: 20,
                            onRatingChanged: (rating) =>
                                setState(() => this.rating = rating),
                          )
                        ],
                      ),
                      const CustomText(
                        text:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                        color: greyColor,
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
