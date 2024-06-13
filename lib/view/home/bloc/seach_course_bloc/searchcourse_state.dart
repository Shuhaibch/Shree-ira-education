part of 'searchcourse_bloc.dart';

sealed class SearchcourseState {
  const SearchcourseState();
}

final class SearchcourseInitial extends SearchcourseState {}

final class GetSearchCourseByNameSuccessState extends SearchcourseState {
  final List<Course> couses;

  const GetSearchCourseByNameSuccessState({required this.couses});
}

final class GetSearchCourseByNameLoadingState extends SearchcourseState {}

final class GetSearchCourseByNameFailedState extends SearchcourseState {}
