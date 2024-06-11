part of 'course_by_id_bloc.dart';

sealed class CourseByIdEvent extends Equatable {
  const CourseByIdEvent();

  @override
  List<Object> get props => [];
}

final class GetCourseByIdEvent extends CourseByIdEvent {
  final String courseId;

  const GetCourseByIdEvent({required this.courseId});
}
