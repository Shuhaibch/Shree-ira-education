import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/course_screen/bloc/course_by_id/course_by_id_bloc.dart';
import 'package:shreeiraeducation/view/course_screen/widgets/course_main_screen_widget.dart';
import 'package:shreeiraeducation/view/notification/screens/notification_screen.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void initState() {
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
        child: BlocBuilder<CourseByIdBloc, CourseByIdState>(
          builder: (context, state) {
            if (state is GetCourseByIdLoadingState) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ),
              );
            }
            if (state is GetCourseByIdFailedState) {
              return const Scaffold(
                body: Center(
                  child: Text('Error Occured Try again'),
                ),
              );
            }
            if (state is GetCourseByIdSuccessState) {
              late YoutubePlayerController _controller;

              if (state.course.url == null) {
                _controller = YoutubePlayerController(
                  initialVideoId: "YLpCPo0FDtE",
                  flags: const YoutubePlayerFlags(
                    autoPlay: true,
                    mute: true,
                  ),
                );
                return Scaffold(
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
                    isImage: true,
                    course: state.course,
                    size: size,
                    controller: _controller,
                  ),
                );
              } else {
                String videoIdd =
                    YoutubePlayer.convertUrlToId(state.course.url!)!;

                _controller = YoutubePlayerController(
                  initialVideoId: videoIdd,
                  flags: const YoutubePlayerFlags(
                    autoPlay: true,
                    mute: false,
                  ),
                );
                return YoutubePlayerBuilder(
                  player: YoutubePlayer(controller: _controller),
                  builder: (context, player) {
                    return Scaffold(
                      // resizeToAvoidBottomInset: false,
                      appBar: AppBar(
                        leading: IconButton(
                          onPressed: () {
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
                                  builder: (context) =>
                                      const NotificationScreen(),
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
                        course: state.course,
                        size: size,
                        controller: _controller,
                      ),
                    );
                  },
                );
              }
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
