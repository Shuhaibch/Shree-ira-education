import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:shreeiraeducation/models/courses/course_by_id_model.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/helper/string_remove.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/snack_bar/snackbar.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/course_screen/widgets/course_brief_widget.dart';
import 'package:shreeiraeducation/view/course_screen/widgets/course_description_widget.dart';

class TheoryScreen extends StatelessWidget {
  const TheoryScreen({
    super.key,
    required this.course,
  });
  final CourseByIdModel course;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        left: 14.0,
        right: 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            elevation: 2,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              height: size.height * 0.17,
              width: double.infinity,
              // color: blackColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "Course Brief",
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),

                    //* Icons Breif
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CourseBriefWidget(
                                textOne: "Category",
                                textTwo: course.courseBrief!.categoryName ?? '',
                                icon: Icons.category,
                              ),
                              const KHeight(size: 0.03),
                              CourseBriefWidget(
                                textOne: "Course Type",
                                textTwo: course.type == '1' ? 'Paid' : "Free",
                                icon: Icons.verified_user_rounded,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CourseBriefWidget(
                                textOne: "Total Videos",
                                textTwo: "${course.theory!.length} Lectures",
                                icon: Icons.live_tv_sharp,
                              ),
                              const KHeight(size: 0.03),
                              course.type == '0'
                                  ? const SizedBox()
                                  : CourseBriefWidget(
                                      textOne: "Price",
                                      textTwo: "₹${course.discountPrice}",
                                      icon: Icons.price_change_outlined,
                                    ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const KHeight(size: 0.02),
          CoursesDescriptionCardWidget(
            size: size,
            description: course.detail!,
          ),
          const KHeight(size: 0.02),
          // CourseCreatedByWidget(size: size),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: course.theory!.length,
              separatorBuilder: (context, index) => const KHeight(size: .01),
              itemBuilder: (context, index) {
                return CoursesExpandedConatinerWidget(
                  theory: course.theory![index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CoursesExpandedConatinerWidget extends StatelessWidget {
  const CoursesExpandedConatinerWidget({
    super.key,
    required this.theory,
  });
  final Theory theory;
  @override
  Widget build(BuildContext context) {
    bool isDownloading = false;

    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      elevation: 2,
      child: ExpansionTile(
        title: CustomText(
          text: theory.chapterName ?? 'Title',
          color: blackColor,
          fontWeight: FontWeight.bold,
        ),
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15, bottom: 15),
                child: CustomText(
                  text: StringHelper.removeFromString(
                      theory.description ?? 'Description'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 20, bottom: 15),
                    child: InkWell(
                      onTap: () {
                        //You can download a single file
// FileDownloader.downloadFile(
//     url: "YOUR DOWNLOAD URL",
//     name: "THE FILE NAME AFTER DOWNLOADING",//(optional)
//     onProgress: (String fileName, double progress) {
//       print('FILE fileName HAS PROGRESS $progress');
//     },
//     onDownloadCompleted: (String path) {
//       print('FILE DOWNLOADED TO PATH: $path');
//     },
//     onDownloadError: (String error) {
//       print('DOWNLOAD ERROR: $error');
//     });
                        // log(theory.file!);
                        FileDownloader.downloadFile(
                          url:
                              'http://axnoldigitalsolutions.in/Training/api/download-pdf/${theory.file!}',
                          onProgress: (fileName, progress) {
                            isDownloading = true;
                            CSnackBar.showSnackBar(context,
                                'Your File is downloading ${progress.toStringAsFixed(2)}%');
                          },
                          onDownloadCompleted: (path) {
                            isDownloading = false;
                            CSnackBar.showSuccessSnackBar(
                                context, "Download Completed");
                          },
                          onDownloadError: (errorMessage) {
                            log(errorMessage);
                            isDownloading = false;
                            CSnackBar.showErrorSnackBar(context, errorMessage);
                          },
                        );
                        // FileDownloader.downloadFile(
                        // url:
                        //     'http://axnoldigitalsolutions.in/Training/files/material/1717653608sample pdf.pdf',
                        // onProgress: (name, progress) {
                        //   // setState(() {
                        //   //   _progress = progress;
                        //   // });
                        //   print('progress');
                        // },
                        // onDownloadCompleted: (value) {
                        //   print('path  $value ');
                        //   // setState(() {
                        //   //   _progress = null;
                        //   // });
                        // });
                      },
                      child: const CustomText(
                        text: 'Download Pdf',
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
