import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/controller/cources/cources_controller.dart';
import 'package:shreeiraeducation/models/courses/courses_model.dart';

part 'outgoingcource_event.dart';
part 'outgoingcource_state.dart';

class OutgoingcourceBloc
    extends Bloc<OutgoingcourceEvent, OutgoingcourceState> {
  final CourseController _controller;
  OutgoingcourceBloc({required CourseController controller})
      : _controller = controller,
        super(OutgoingcourceInitial()) {
    on<GetAllCourcesEvent>(_onGetAllCourse);
    on<GetFilterCourcesEvent>(_onGeFilteredtAllCourse);
  }

  void _onGetAllCourse(
      GetAllCourcesEvent event, Emitter<OutgoingcourceState> emit) async {
    emit(const GetOutgoingcourceLoadingState());
    final res = await _controller.getAllCourse(
        categoryId: event.categoryId, subCategoryId: event.subCategoryId);
    try {
      if (res['response'] == 'success') {
        emit(GetOutgoingcourceSuccessState(courses: res['data']));
      } else {
        emit(GetOutgoingcourceFailedState(errorMsg: res['message']));
      }
    } catch (e) {
      emit(
        GetOutgoingcourceFailedState(
          errorMsg: e.toString(),
        ),
      );
    }
  }

  void _onGeFilteredtAllCourse(
      GetFilterCourcesEvent event, Emitter<OutgoingcourceState> emit) async {
    emit(const GetOutgoingcourceLoadingState());
    final res = await _controller.getFilteredCourse(
      categoryId: event.categoryId,
      subCategoryId: event.subCategoryId,
      priceType: event.priceType,
      sortBy: event.priceType,
    );
    try {
      if (res['response'] == 'success') {
        emit(GetFilteredOutgoingcourceSuccessState(courses: res['data']));
      } else {
        emit(GetFilteredOutgoingcourceFailedState(errorMsg: res['message']));
      }
    } catch (e) {
      emit(
        GetFilteredOutgoingcourceFailedState(
          errorMsg: e.toString(),
        ),
      );
    }
  }
}
