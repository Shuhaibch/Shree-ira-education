import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/controller/authentication/auth_controller.dart';
import 'package:shreeiraeducation/models/authentication/login_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthController _authController;
  AuthenticationBloc({
    required AuthController authController,
  })  : _authController = authController,
        super(AuthenticationInitial()) {
    on<AuthenticationEvent>((_, emit) => emit(UserLogginLoadingState()));
    on<UserLoginEvent>(_onUserLogin);
    on<UserSignUpEvent>(_onUserSignUp);
  }

  //* Login
  void _onUserLogin(
      UserLoginEvent event, Emitter<AuthenticationState> emit) async {
    final res = await _authController.signin(
        email: event.email, password: event.password);
    
      if (res['response'] == 'success') {
        emit(UserLogginSuccessState(user: res['data']));
      } else {
        emit(UserLogginFailedState(errorMsg: res['message']));
      }
    
  }

  //* SingUp
  void _onUserSignUp(
      UserSignUpEvent event, Emitter<AuthenticationState> emit) async {
    final res = await _authController.signUp(
      email: event.email,
      password: event.password,
      firstName: event.firstName,
      lastName: event.lastName,
    );
    try {
      if (res['response'] == 'success') {
        emit(UserSignUpSuccessState());
      } else {
        emit(UserSignUpFailedState(errorMsg: res['message']));
      }
    } catch (e) {
      emit(UserSignUpFailedState(errorMsg: e.toString()));
    }
  }
}
