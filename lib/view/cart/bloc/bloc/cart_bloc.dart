import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/controller/cart/cart_controller.dart';
import 'package:shreeiraeducation/models/cart/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartController _controller;
  bool courseInCart = false;
  CartBloc({required CartController controller})
      : _controller = controller,
        super(CartInitial()) {
    on<AddToCartEvent>(_onAddToCart);
    on<GetCartCourseEvent>(_onGetCartCourse);
    on<DeleteCartCourseEvent>(_onDeleteCartCourse);
  }
  void _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    emit(AddCartLoadingState());
    if (courseInCart == true) {
      emit(const AddCartAlreadyInCartState(msg: 'Already Course in Cart'));
    } else {
      final res = await _controller.addToCart(courseId: event.courseId);
      try {
        if (res['response'] == 'success') {
          courseInCart = true;
          emit(AddCartSuccessState());
        } else if (res['response'] == 'already In cart') {
          emit(const AddCartAlreadyInCartState(
              msg: 'This Course already in cart'));
        }
      } catch (e) {
        emit(AddCartFailedState());
      }
    }
  }

  void _onGetCartCourse(
      GetCartCourseEvent event, Emitter<CartState> emit) async {
    emit(GetCartCourseLoadingState());
    final res = await _controller.getCartCourses();

    if (res['response'] == 'success') {
      final List<CartCourse>? course = res['data'];
      log(course.runtimeType.toString());
      log(course.toString());
      if (course!.isNotEmpty) {
        courseInCart = true;
      } else {
        courseInCart = false;
      }
      emit(GetCartCourseSuccessState(course: res['data']));
    } else {
      emit(GetCartCourseFailedState());
    }
  }

  void _onDeleteCartCourse(
      DeleteCartCourseEvent event, Emitter<CartState> emit) async {
    emit(DeleteCartCourseLoadingState());
    final res = await _controller.deleteCartCourses(courseId: event.courseId);

    if (res['response'] == 'success') {
      courseInCart = false;
      emit(DeleteCartCourseSuccessState());
    } else {
      emit(DeleteCartCourseFailedState());
    }
  }
}
