part of 'edit_user_bloc.dart';

@immutable
sealed class EditUserEvent {}

final class UpdateUserDetailsEvent extends EditUserEvent {
  final String fname;
  final String lname;
  final String address;
  final String password;
  final String details;
  final String email;
  final String mobile;
  final XFile? image;
  final String? imageUrl;

  UpdateUserDetailsEvent( 
      {required this.fname,
      required this.imageUrl,
      required this.mobile,
      required this.lname,
      required this.address,
      required this.password,
      required this.details,
      required this.email,
      required this.image});
}
