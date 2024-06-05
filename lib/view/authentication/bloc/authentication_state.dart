part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class UserLogginSuccessState extends AuthenticationState {
  final User user;

  UserLogginSuccessState({required this.user});
}

final class UserLogginFailedState extends AuthenticationState {
  final String errorMsg;

  UserLogginFailedState({required this.errorMsg});
}

final class UserLogginLoadingState extends AuthenticationState {}

final class UserSignUpSuccessState extends AuthenticationState {}

final class UserSignUpFailedState extends AuthenticationState {
  final String errorMsg;

  UserSignUpFailedState({required this.errorMsg});
}

final class UserSignUpLoadingState extends AuthenticationState {}
