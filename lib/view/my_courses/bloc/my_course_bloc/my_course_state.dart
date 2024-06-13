part of 'my_course_bloc.dart';

sealed class MyCourseState extends Equatable {
  const MyCourseState();

  @override
  List<Object> get props => [];
}

final class MyCourseInitial extends MyCourseState {}

final class GetMyEnrolledCourseSuccessState extends MyCourseState {
  final List<EnrollDetail> enrolledCourseList;

  const GetMyEnrolledCourseSuccessState({required this.enrolledCourseList});
}

final class GetMyEnrolledCourseLoadingState extends MyCourseState {}

final class GetMyEnrolledCourseFailedState extends MyCourseState {}
