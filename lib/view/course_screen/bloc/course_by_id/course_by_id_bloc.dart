import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/controller/cources/cources_controller.dart';
import 'package:shreeiraeducation/models/courses/course_by_id_model.dart';

part 'course_by_id_event.dart';
part 'course_by_id_state.dart';

class CourseByIdBloc extends Bloc<CourseByIdEvent, CourseByIdState> {
  final CourseController _controller;

  CourseByIdBloc({
    required CourseController controller,
  })  : _controller = controller,
        super(CourseByIdInitial()) {
    on<GetCourseByIdEvent>(_onGetCourseById);
  }

  void _onGetCourseById(
      GetCourseByIdEvent event, Emitter<CourseByIdState> emit) async {
    emit(GetCourseByIdLoadingState());
    final res = await _controller.getCourseById(courseId: event.courseId);
    try {
      if (res['response'] == 'success') {
        emit(GetCourseByIdSuccessState(course: res['data']));
      } else {
        emit(GetCourseByIdFailedState(errorMsg: res['message']));
      }
    } catch (e) {
      emit(GetCourseByIdFailedState(errorMsg: e.toString()));
    }
  }
}
