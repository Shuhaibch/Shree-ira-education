import 'package:get_it/get_it.dart';
import 'package:shreeiraeducation/controller/authentication/auth_controller.dart';
import 'package:shreeiraeducation/controller/user_details/user_controller.dart';
import 'package:shreeiraeducation/view/authentication/bloc/authentication_bloc.dart';
import 'package:shreeiraeducation/view/edit_profile/bloc/bloc/edit_user_bloc.dart';
import 'package:shreeiraeducation/view/home/widgets/drawer/bloc/user/user_bloc.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _initAuth();
  _initUser();

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
  serviceLocator.registerFactory(
    () => UserController(),
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
    );
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
