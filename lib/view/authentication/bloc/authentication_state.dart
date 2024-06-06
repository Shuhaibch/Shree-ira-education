part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}
final class UserIsLoggedInState extends AuthenticationState{}
final class UserIsLoggedInLoadingState extends AuthenticationState{}
final class UserIsLoggedInFailedState extends AuthenticationState{}
final class UserLogginSuccessState extends AuthenticationState {
  
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

final class UserLogOutSuccess extends AuthenticationState {}

final class UserLogOutFailed extends AuthenticationState {}
