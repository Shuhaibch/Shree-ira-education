import 'package:get_it/get_it.dart';
import 'package:shreeiraeducation/controller/authentication/auth_controller.dart';
import 'package:shreeiraeducation/controller/cart/cart_controller.dart';
import 'package:shreeiraeducation/controller/categories/categories_controller.dart';
import 'package:shreeiraeducation/controller/cources/cources_controller.dart';
import 'package:shreeiraeducation/controller/terms_conditon/terms_condition_controller.dart';
import 'package:shreeiraeducation/controller/user_details/user_controller.dart';
import 'package:shreeiraeducation/view/authentication/bloc/authentication_bloc.dart';
import 'package:shreeiraeducation/view/cart/bloc/bloc/cart_bloc.dart';
import 'package:shreeiraeducation/view/course_screen/bloc/course_by_id/course_by_id_bloc.dart';
import 'package:shreeiraeducation/view/edit_profile/bloc/bloc/edit_user_bloc.dart';
import 'package:shreeiraeducation/view/home/bloc/category_bloc/category_bloc.dart';
import 'package:shreeiraeducation/view/home/bloc/seach_course_bloc/searchcourse_bloc.dart';
import 'package:shreeiraeducation/view/home/widgets/drawer/bloc/user/user_bloc.dart';
import 'package:shreeiraeducation/view/home/widgets/drawer/terms_condition/bloc/terms_condition/termscondition_bloc.dart';
import 'package:shreeiraeducation/view/my_courses/bloc/my_course_bloc/my_course_bloc.dart';
import 'package:shreeiraeducation/view/outgoing_course/bloc/outgoingcource/outgoingcource_bloc.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _initAuth();
  _initUser();
  _initProduct();
  _initCourse();
  // // Core
  // serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator.registerFactory(() => AuthController());

  //* Bloc
  serviceLocator.registerLazySingleton(
    () => AuthenticationBloc(
      authController: serviceLocator(),
    ),
  );
}

void _initUser() {
  serviceLocator
    ..registerFactory(
      () => UserController(),
    )
    ..registerFactory(
      () => TermsAndConditionController(),
    );
  //* Bloc
  serviceLocator
    ..registerLazySingleton(
      () => UserBloc(
        controller: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => EditUserBloc(controller: serviceLocator()),
    )
    ..registerLazySingleton(
      () => TermsconditionBloc(controller: serviceLocator()),
    );
}

void _initCourse() {
  serviceLocator
    ..registerFactory(
      () => CourseController(),
    )
    ..registerFactory(
      () => CartController(),
    );
  //* Bloc
  serviceLocator
    ..registerLazySingleton(
      () => OutgoingcourceBloc(
        controller: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => CourseByIdBloc(controller: serviceLocator()),
    )
    ..registerLazySingleton(
      () => CartBloc(controller: serviceLocator()),
    )
    ..registerLazySingleton(
      () => SearchcourseBloc(controller: serviceLocator()),
    )
    ..registerLazySingleton(
      () => MyCourseBloc(controller: serviceLocator()),
    );
}

void _initProduct() {
  serviceLocator.registerFactory(
    () => CategoryController(),
  );
  //* Bloc
  serviceLocator.registerLazySingleton(
    () => CategoryBloc(
      controller: serviceLocator(),
    ),
  );
  // ..registerLazySingleton(
  //   () => EditUserBloc(controller: serviceLocator()),
  // );
}
// void _initOrder() {
//   serviceLocator.registerFactory(
//     () => OrderController(),
//   );

//   //bloc
//   serviceLocator
//     ..registerLazySingleton(
//       () => OrderBloc(orderController: serviceLocator()),
//     )
//     ..registerLazySingleton(
//       () => OrderDetailsBloc(orderController: serviceLocator()),
//     );
// }
