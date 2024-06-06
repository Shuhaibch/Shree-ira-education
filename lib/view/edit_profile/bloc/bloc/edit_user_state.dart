part of 'edit_user_bloc.dart';

@immutable
sealed class EditUserState {}

final class EditUserInitial extends EditUserState {}

final class UpdateUserDetailsLoadingState extends EditUserState {}

final class UpdateUserDetailsSuccessState extends EditUserState {}

final class UpdateUserDetailsFailedState extends EditUserState {
  final String errorMsg;

  UpdateUserDetailsFailedState({required this.errorMsg});
}
