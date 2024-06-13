
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/controller/cources/cources_controller.dart';
import 'package:shreeiraeducation/models/courses/my_enrolled_course.dart';

part 'my_course_event.dart';
part 'my_course_state.dart';

class MyCourseBloc extends Bloc<MyCourseEvent, MyCourseState> {
  final CourseController _controller;
  MyCourseBloc({required CourseController controller})
      : _controller = controller,
        super(MyCourseInitial()) {
    on<GetMyEnrolledCoursesEvent>(_onGetMyEnrolledCourse);
  }
  void _onGetMyEnrolledCourse(
      GetMyEnrolledCoursesEvent event, Emitter<MyCourseState> emit) async {
    emit(GetMyEnrolledCourseLoadingState());
    final res = await _controller.getMyEnrolledCourse();

    if (res['response'] == 'success') {
      emit(GetMyEnrolledCourseSuccessState(enrolledCourseList: res['data']));
    } else {
      emit(GetMyEnrolledCourseFailedState());
    }
  }
}
