part of 'course_by_id_bloc.dart';

sealed class CourseByIdState extends Equatable {
  const CourseByIdState();

  @override
  List<Object> get props => [];
}

final class CourseByIdInitial extends CourseByIdState {}

final class GetCourseByIdSuccessState extends CourseByIdState {
  final CourseByIdModel course;

  const GetCourseByIdSuccessState({required this.course});
}

final class GetCourseByIdFailedState extends CourseByIdState {
  final String errorMsg;

  const GetCourseByIdFailedState({required this.errorMsg});
}

final class GetCourseByIdLoadingState extends CourseByIdState {}
