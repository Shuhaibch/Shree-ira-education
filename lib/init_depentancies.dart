
import 'package:get_it/get_it.dart';
import 'package:shreeiraeducation/controller/authentication/auth_controller.dart';
import 'package:shreeiraeducation/view/authentication/bloc/authentication_bloc.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _initAuth();
  // _initOrder();

  // // Core
  // serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator.registerFactory(() => AuthController());

  //* Bloc
  serviceLocator.registerLazySingleton(
    () => AuthenticationBloc(
        authController: serviceLocator(),),
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
