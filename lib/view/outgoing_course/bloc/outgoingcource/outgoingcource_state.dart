part of 'outgoingcource_bloc.dart';

sealed class OutgoingcourceState extends Equatable {
  const OutgoingcourceState();

  @override
  List<Object> get props => [];
}

final class OutgoingcourceInitial extends OutgoingcourceState {}

final class GetOutgoingcourceSuccessState extends OutgoingcourceState {
  final List<Course> courses;

  const GetOutgoingcourceSuccessState({required this.courses});
}

final class GetOutgoingcourceFailedState extends OutgoingcourceState {
  final String errorMsg;

  const GetOutgoingcourceFailedState({required this.errorMsg});
}

final class GetOutgoingcourceLoadingState extends OutgoingcourceState {
  const GetOutgoingcourceLoadingState();
}

final class GetFilteredOutgoingcourceSuccessState extends OutgoingcourceState {
  final List<Course> courses;

  const GetFilteredOutgoingcourceSuccessState({required this.courses});
}

final class GetFilteredOutgoingcourceFailedState extends OutgoingcourceState {
  final String errorMsg;

  const GetFilteredOutgoingcourceFailedState({required this.errorMsg});
}

final class GetFilteredOutgoingcourceLoadingState extends OutgoingcourceState {
  const GetFilteredOutgoingcourceLoadingState();
}
