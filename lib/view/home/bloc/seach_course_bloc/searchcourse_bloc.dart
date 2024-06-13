import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/controller/cources/cources_controller.dart';

import '../../../../models/courses/search_course_model.dart';

part 'searchcourse_event.dart';
part 'searchcourse_state.dart';

class SearchcourseBloc extends Bloc<SearchcourseEvent, SearchcourseState> {
  final CourseController _controller;
  SearchcourseBloc({required CourseController controller})
      : _controller = controller,
        super(SearchcourseInitial()) {
    on<GetCourseBySeachEvent>(_onGetSearchCourse);
  }

  void _onGetSearchCourse(
      GetCourseBySeachEvent event, Emitter<SearchcourseState> emit) async {
    emit(GetSearchCourseByNameLoadingState());
    final res =
        await _controller.getCourseBySearch(courseName: event.courseName);

    if (res['response'] == 'success') {
      final List<Course> courses = res['data'];
      if (courses.isEmpty) {
        emit(GetSearchCourseByNameFailedState());
      } else {
        emit(
          GetSearchCourseByNameSuccessState(
            couses: res['data'],
          ),
        );
      }
    } else {
      // emit(GetSearchCourseByNameLoadingState());
    }
  }
}
