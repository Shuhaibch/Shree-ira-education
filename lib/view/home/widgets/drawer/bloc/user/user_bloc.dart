import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/controller/user_details/user_controller.dart';
import 'package:shreeiraeducation/models/user/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserController _controller;
  UserBloc({
    required UserController controller,
  })  : _controller = controller,
        super(UserInitial()) {
    on<GetUserDetailsEvent>(_onGetUserDetails);
  }
  void _onGetUserDetails(
      GetUserDetailsEvent event, Emitter<UserState> emit) async {
    emit(GetUserDetailsLoadingState());
    final res = await _controller.getUserDetails();
    try {
      if (res['response'] == 'success') {
        emit(GetUserDetailsSuccessState(user: res['data']));
      } else {
        emit(GetUserDetailsFailedState(errorMsg: res['message']));
      }
    } catch (e) {
      emit(GetUserDetailsFailedState(errorMsg: e.toString()));
    }
  }

  
}
