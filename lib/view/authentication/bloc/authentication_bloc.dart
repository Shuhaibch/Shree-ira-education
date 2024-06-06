import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    // on<AuthenticationEvent>((_, emit) => emit(UserLogginLoadingState()));
    on<UserLoginEvent>(_onUserLogin);
    on<UserSignUpEvent>(_onUserSignUp);
    on<UserIsLoggedInEvent>(_onUserIsLoggedIn);
    on<UserLogOutEvent>(_onUserLogOut);
  }

  //* Login
  void _onUserLogin(
      UserLoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(UserLogginLoadingState());
    final res = await _authController.signin(
        email: event.email, password: event.password);

    if (res['response'] == 'success') {
      _updateUserProfile(user: res['data']);
      emit(UserLogginSuccessState());
    } else {
      emit(UserLogginFailedState(errorMsg: res['message']));
    }
  }

  //* SingUp
  void _onUserSignUp(
      UserSignUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(UserLogginLoadingState());

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

  void _onUserIsLoggedIn(
      UserIsLoggedInEvent event, Emitter<AuthenticationState> emit) async {
    emit(UserIsLoggedInLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.get('token') as String;
    log(token);

    try {
  if (prefs.containsKey('token')) {
    emit(UserIsLoggedInState());
  } else {
    emit(UserIsLoggedInFailedState());
  }
}  catch (e) {
    emit(UserIsLoggedInFailedState());
}
  }

  void _onUserLogOut(
      UserLogOutEvent event, Emitter<AuthenticationState> emit) async {
    emit(UserLogginLoadingState());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');

    emit(UserLogOutSuccess());
  }

  void _updateUserProfile({required User user}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profileImage', user.userImg!);
    prefs.setString('userName', user.fname);
    prefs.setString('userEmail', user.email);
  }
}
