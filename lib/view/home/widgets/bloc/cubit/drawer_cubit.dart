import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());
  getUserDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final DrawerUserModel user = DrawerUserModel(
      name: pref.getString('userName') ?? '',
      email: pref.getString('userEmail') ?? '',
      profileImage: pref.getString('profileImage'),
    );
    emit(
      GetUserDetails(
        name: user.name,
        email: user.email,
        profileImage: user.profileImage,
      ),
    );
  }
}

class DrawerUserModel {
  final String name;
  final String email;
  final String? profileImage;

  DrawerUserModel({
    required this.name,
    required this.email,
    required this.profileImage,
  });
}
