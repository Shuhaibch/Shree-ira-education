import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/models/categories/categories_model.dart';
import 'package:shreeiraeducation/models/categories/sub_category_model.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/outgoing_course/bloc/outgoingcource/outgoingcource_bloc.dart';
import 'package:shreeiraeducation/view/outgoing_course/widgets/filter_drawer_widget.dart';
import 'package:shreeiraeducation/view/outgoing_course/widgets/out_going_course_list_loader_widget.dart';
import 'package:shreeiraeducation/view/outgoing_course/widgets/out_going_course_list_widget.dart';

class OutgoingCourseScreen extends StatelessWidget {
  OutgoingCourseScreen(
      {super.key, required this.subCategory, required this.category});
  final SubCategory? subCategory;
  final Category? category;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
            child: FilterDrawerWidget(
          category: category!,
          subCategory: subCategory!,
        )),
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
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.search,
                color: whiteColor,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: themeColor,
                height: size.height * 0.09,
              ),
              BlocBuilder<OutgoingcourceBloc, OutgoingcourceState>(
                builder: (context, state) {
                  if (state is GetOutgoingcourceSuccessState) {
                    return OutGoingCourseListWidget(
                      size: size,
                      course: state.courses,
                    );
                  }
                  if (state is GetFilteredOutgoingcourceSuccessState) {
                    if (state.courses == []) {
                      return const Center(
                        child: Text('No Courses Available'),
                      );
                    }
                    return OutGoingCourseListWidget(
                      size: size,
                      course: state.courses,
                    );
                  }
                  if (state is GetFilteredOutgoingcourceSuccessState) {
                    if (state.courses == []) {
                      return const Center(
                        child: Text('No Courses Available'),
                      );
                    }
                    return OutGoingCourseListWidget(
                      size: size,
                      course: state.courses,
                    );
                  }
                  if (state is GetFilteredOutgoingcourceLoadingState) {
                    return OutGoingCourseListLoadingWidget(size: size);
                  }
                  if (state is GetOutgoingcourceFailedState) {
                    return const Center(
                      child: Text('Error While Loading Data'),
                    );
                  }
                  return OutGoingCourseListLoadingWidget(size: size);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
