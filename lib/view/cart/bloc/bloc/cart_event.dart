part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class AddToCartEvent extends CartEvent {
  final String courseId;

  const AddToCartEvent({required this.courseId});
}

final class GetCartCourseEvent extends CartEvent {
  const GetCartCourseEvent();
}

final class DeleteCartCourseEvent extends CartEvent {
  final String courseId;
  const DeleteCartCourseEvent({required this.courseId});
}
final class CourseCheckOutEvent extends CartEvent{
  
}