import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shreeiraeducation/controller/user_details/user_controller.dart';

part 'edit_user_event.dart';
part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {
  final UserController _controller;
  EditUserBloc({required UserController controller})
      : _controller = controller,
        super(EditUserInitial()) {
    on<UpdateUserDetailsEvent>(_onUpdateUserDetails);
  }
  void _onUpdateUserDetails(
      UpdateUserDetailsEvent event, Emitter<EditUserState> emit) async {
    emit(UpdateUserDetailsLoadingState());
    final res = await _controller.updateUserDetails(
        firstName: event.fname,
        lastName: event.lname,
        email: event.email,
        mobile: event.mobile,
        password: event.password,
        address: event.address,
        detail: event.details,
        image: event.image,
        imageUrl: event.imageUrl);
    try {
      if (res['response'] == 'success') {
        emit(UpdateUserDetailsSuccessState());
      } else {
        emit(UpdateUserDetailsFailedState(errorMsg: res['message']));
      }
    } catch (e) {
      emit(UpdateUserDetailsFailedState(errorMsg: e.toString()));
    }
  }
}
