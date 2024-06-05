part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class UserLoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  UserLoginEvent({
    required this.email,
    required this.password,
  });
}

final class UserSignUpEvent extends AuthenticationEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  UserSignUpEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
