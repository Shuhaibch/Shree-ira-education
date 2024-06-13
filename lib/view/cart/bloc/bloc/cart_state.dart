part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class AddCartLoadingState extends CartState {}

final class AddCartSuccessState extends CartState {}

final class AddCartFailedState extends CartState {}

final class AddCartAlreadyInCartState extends CartState {
  final String msg;

  const AddCartAlreadyInCartState({required this.msg});
}

// ******************************************************

final class GetCartCourseLoadingState extends CartState {}

final class GetCartCourseSuccessState extends CartState {
  final List<CartCourse> course;

  const GetCartCourseSuccessState({required this.course});
}

final class GetCartCourseFailedState extends CartState {}

// ******************************************************

final class DeleteCartCourseLoadingState extends CartState {}

final class DeleteCartCourseSuccessState extends CartState {}

final class DeleteCartCourseFailedState extends CartState {}

// ******************************************************

final class CourseCheckOutLoadingState extends CartState {}

final class CourseCheckOutSuccessState extends CartState {}

final class CourseCheckOutFailedState extends CartState {}
