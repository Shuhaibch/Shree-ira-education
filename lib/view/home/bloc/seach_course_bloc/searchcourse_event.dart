part of 'searchcourse_bloc.dart';

sealed class SearchcourseEvent {
  const SearchcourseEvent();
}

final class GetCourseBySeachEvent extends SearchcourseEvent {
  final String courseName;

  const GetCourseBySeachEvent({required this.courseName});
}
