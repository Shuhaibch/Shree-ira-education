import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/commen/widget/shimmer/shimmer_effect.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/debouncer/debouncer.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/course_screen/bloc/course_by_id/course_by_id_bloc.dart';
import 'package:shreeiraeducation/view/course_screen/screens/course_main_screen.dart';
import 'package:shreeiraeducation/view/home/bloc/seach_course_bloc/searchcourse_bloc.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    super.key,
  });
  final _debouncer = Debouncer(milliseconds: 1000);
  @override
  Widget build(BuildContext context) {
    TextEditingController searchCtrl = TextEditingController();

    var size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.23,
      left: 20,
      right: 20,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: TextFormField(
                controller: searchCtrl,
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  _debouncer.run(() {
                    context
                        .read<SearchcourseBloc>()
                        .add(GetCourseBySeachEvent(courseName: value));
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search for course, mentor, topic, etc.',
                  hintStyle: const TextStyle(color: greyColor),
                  filled: true,
                  fillColor: whiteColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 199, 189, 189)),
                  ),
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: redColor,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                ),
              ),
            ),
          ),
          BlocBuilder<SearchcourseBloc, SearchcourseState>(
            builder: (context, state) {
              if (state is GetSearchCourseByNameSuccessState) {
                return searchCtrl.text.isEmpty
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          color: Colors.white,
                          height: size.height * .2,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: state.couses.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    context.read<CourseByIdBloc>().add(
                                        GetCourseByIdEvent(
                                            courseId: state.couses[index].id
                                                .toString()));
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return const CourseScreen();
                                      },
                                    ));
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    child: CustomText(
                                      text:
                                          state.couses[index].title ?? 'Course',
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
              }
              if (state is GetSearchCourseByNameLoadingState) {
                return searchCtrl.text.isEmpty
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          color: Colors.white,
                          height: size.height * .2,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    color: Colors.white,
                                    child:
                                        CShimmerEffect(width: 10, height: 5)),
                              );
                            },
                          ),
                        ),
                      );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}

// SearchField(
//           suggestions: suggestions
//               .map(
//                 (e) => SearchFieldListItem<String>(
//                   e,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 4.0),
//                     child: Text(e,
//                         style: TextStyle(fontSize: 24, color: Colors.red)),
//                   ),
//                 ),
//               )
//               .toList(),
//           // hint: '  Search for course, mentor, topic, etc.',
//           // autofocus: true,
//           onSearchTextChanged: (p0) {},
//           suggestionsDecoration: SuggestionDecoration(
//             color: Colors.white,
//           ),
//           suggestionItemDecoration: SuggestionDecoration(),
//           suggestionStyle: TextStyle(color: Colors.black),
//           focusNode: FocusNode(canRequestFocus: true),
//           searchInputDecoration: InputDecoration(
//             hintText: 'Search for course, mentor, topic, etc.',
//             hintStyle: const TextStyle(color: greyColor),
//             filled: true,
//             fillColor: whiteColor,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12.0),
//               borderSide:
//                   const BorderSide(color: Color.fromARGB(255, 199, 189, 189)),
//             ),
//             prefixIcon: const Icon(
//               CupertinoIcons.search,
//               color: redColor,
//             ),
//             contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
//           ),
//         ),