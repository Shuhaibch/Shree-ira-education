part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class GetUserDetailsLoadingState extends UserState {}

final class GetUserDetailsSuccessState extends UserState {
  final User user;

  GetUserDetailsSuccessState({required this.user});
}

final class GetUserDetailsFailedState extends UserState {
  final String errorMsg;

  GetUserDetailsFailedState({required this.errorMsg});
}
