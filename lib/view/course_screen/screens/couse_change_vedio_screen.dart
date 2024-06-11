import 'package:flutter/material.dart';
import 'package:shreeiraeducation/models/courses/course_by_id_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/course_screen/widgets/course_main_screen_widget.dart';
import 'package:shreeiraeducation/view/notification/screens/notification_screen.dart';

class CourseChangeVedioScreen extends StatefulWidget {
  const CourseChangeVedioScreen(
      {super.key, required this.url, required this.course});
  final String url;
  final CourseByIdModel course;
  @override
  State<CourseChangeVedioScreen> createState() =>
      _CourseChangeVedioScreenState();
}

class _CourseChangeVedioScreenState extends State<CourseChangeVedioScreen> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    String videoIdd = YoutubePlayer.convertUrlToId(widget.url)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoIdd,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    super.initState();
  }

  double rating = 3.5;
  @override
  void dispose() {
    super.dispose();
  }

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
                _controller.pause();
                _controller.dispose();
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.notifications,
                  color: whiteColor,
                ),
              )
            ],
          ),
          body: CourseMainScreenWidget(
            // isImage: true,
            course: widget.course,
            size: size,
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
