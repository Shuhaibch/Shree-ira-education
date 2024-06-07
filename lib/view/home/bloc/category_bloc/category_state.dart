part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class GetCategoriesLoadingState extends CategoryState {}

final class GetCategoriesSuccessState extends CategoryState {
  final List<CategoryAndSubCategory> categoryAndSubCategoryList;

  const GetCategoriesSuccessState({required this.categoryAndSubCategoryList});
}

final class GetCategoriesFailedState extends CategoryState {
  final String errorMsg;

  const GetCategoriesFailedState({required this.errorMsg});
}
