import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/controller/categories/categories_controller.dart';
import 'package:shreeiraeducation/models/categories/categories_model.dart';
import 'package:shreeiraeducation/models/categories/sub_category_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryController _controller;
  CategoryBloc({required CategoryController controller})
      : _controller = controller,
        super(CategoryInitial()) {
    on<GetAllCategorieEvent>(_onGetAllCategories);
  }
  void _onGetAllCategories(
      GetAllCategorieEvent event, Emitter<CategoryState> emit) async {
    emit(GetCategoriesLoadingState());
    final res = await _controller.getAllCategories();
    final subRes = await _controller.getSubCategories();
    try {
      if (res['response'] == 'success') {
        final List<Category> categoryList = res['data'];
        final List<SubCategory> subCategoryList = subRes['data'];
        List<CategoryAndSubCategory> categoryAndSubCategoryList = [];

        for (var category in categoryList) {
          CategoryAndSubCategory categoryAndSubCategory =
              CategoryAndSubCategory(category: category, subCategory: []);

          for (var subCategory in subCategoryList) {
            if (subCategory.categoryId == category.id.toString()) {
              categoryAndSubCategory.subCategory.add(subCategory);
            }
          }
          categoryAndSubCategoryList.add(categoryAndSubCategory);
        }

        emit(
          GetCategoriesSuccessState(
              categoryAndSubCategoryList: categoryAndSubCategoryList),
        );
      } else {
        emit(GetCategoriesFailedState(errorMsg: res['message']));
      }
    } catch (e) {
      emit(GetCategoriesFailedState(errorMsg: e.toString()));
    }
  }
}

class CategoryAndSubCategory {
  Category category;
  List<SubCategory> subCategory;

  CategoryAndSubCategory({required this.category, required this.subCategory});
  static CategoryAndSubCategory empty() => CategoryAndSubCategory(
        category: Category(
            id: 0,
            title: '',
            icon: '',
            slug: '',
            featured: '',
            status: '',
            position: '',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            catImage: ''),
        subCategory: [],
      );

  static String courseCount(List<SubCategory> subCategory) {
    int count = 0;
    for (var element in subCategory) {
      var course = element.coursesCount;
      count = count + int.parse(course);
    }
    return count.toString();
  }
}
