import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/init_depentancies.dart';
import 'package:shreeiraeducation/simple_bloc_observer.dart';
import 'package:shreeiraeducation/view/authentication/bloc/authentication_bloc.dart';
import 'package:shreeiraeducation/view/authentication/screens/login_screen.dart';
import 'package:shreeiraeducation/view/cart/bloc/bloc/cart_bloc.dart';
import 'package:shreeiraeducation/view/course_screen/bloc/course_by_id/course_by_id_bloc.dart';
import 'package:shreeiraeducation/view/edit_profile/bloc/bloc/edit_user_bloc.dart';
import 'package:shreeiraeducation/view/home/bloc/category_bloc/category_bloc.dart';
import 'package:shreeiraeducation/view/home/widgets/drawer/bloc/user/user_bloc.dart';
import 'package:shreeiraeducation/view/home/screens/home_screen.dart';
import 'package:shreeiraeducation/view/outgoing_course/bloc/outgoingcource/outgoingcource_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
   SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<AuthenticationBloc>(),
        ),
        
        BlocProvider(
          create: (context) => serviceLocator<UserBloc>()..add(GetUserDetailsEvent()),
        ),
        BlocProvider(
          create: (context) => serviceLocator<OutgoingcourceBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<EditUserBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<CategoryBloc>()..add(GetAllCategorieEvent()),
        ),
        BlocProvider(
          create: (context) => serviceLocator<CourseByIdBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<CartBloc>()..add(const GetCartCourseEvent()),
        ),
      ],
      child: BlocProvider(
        create: (context) =>
            serviceLocator<AuthenticationBloc>()..add(UserIsLoggedInEvent()),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is UserIsLoggedInState) {
            
            return const HomeScreen();
          } else if (state is UserIsLoggedInFailedState) {

            return const LoginScreen();
          }
          // if (state is UserIsLoggedInLoadingState) {
          //   return const Center(child: CircularProgressIndicator(color: Colors.orange));
          // }
          return const LoginScreen();
        },
      ),
    );
  }
}
