part of 'drawer_cubit.dart';

@immutable
sealed class DrawerState {}

final class DrawerInitial extends DrawerState {}

final class GetUserDetails extends DrawerState {
  final String name;
  final String email;
  final String? profileImage;

  GetUserDetails({
    required this.name,
    required this.email,
    required this.profileImage,
  });
}
