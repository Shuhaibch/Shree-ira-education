import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/init_depentancies.dart';
import 'package:shreeiraeducation/simple_bloc_observer.dart';
import 'package:shreeiraeducation/view/authentication/bloc/authentication_bloc.dart';
import 'package:shreeiraeducation/view/cart/bloc/bloc/cart_bloc.dart';
import 'package:shreeiraeducation/view/course_screen/bloc/course_by_id/course_by_id_bloc.dart';
import 'package:shreeiraeducation/view/edit_profile/bloc/bloc/edit_user_bloc.dart';
import 'package:shreeiraeducation/view/home/bloc/category_bloc/category_bloc.dart';
import 'package:shreeiraeducation/view/home/bloc/seach_course_bloc/searchcourse_bloc.dart';
import 'package:shreeiraeducation/view/home/widgets/drawer/bloc/user/user_bloc.dart';
import 'package:shreeiraeducation/view/home/widgets/drawer/terms_condition/bloc/terms_condition/termscondition_bloc.dart';
import 'package:shreeiraeducation/view/loader/loader_screen.dart';
import 'package:shreeiraeducation/view/my_courses/bloc/my_course_bloc/my_course_bloc.dart';
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
          create: (context) =>
              serviceLocator<AuthenticationBloc>()..add(UserIsLoggedInEvent()),
        ),
        BlocProvider(
          create: (context) =>
              serviceLocator<UserBloc>()..add(GetUserDetailsEvent()),
        ),
        BlocProvider(
          create: (context) => serviceLocator<OutgoingcourceBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<EditUserBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<SearchcourseBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              serviceLocator<CategoryBloc>()..add(GetAllCategorieEvent()),
        ),
        BlocProvider(
          create: (context) => serviceLocator<CourseByIdBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              serviceLocator<CartBloc>()..add(const GetCartCourseEvent()),
        ),
        BlocProvider(
          create: (context) => serviceLocator<TermsconditionBloc>()
            ..add(GetTermsAndConditionEvent()),
        ),
        BlocProvider(
          create: (context) =>
              serviceLocator<MyCourseBloc>()..add(GetMyEnrolledCoursesEvent()),
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
          // log(state.toString());
          // if (state is UserIsLoggedInState) {
          //   return const HomeScreen();
          // }
          // if (state is UserIsLoggedInFailedState) {
          //   return const LoginScreen();
          // }
          // if (state is UserIsLoggedInLoadingState) {
          //   return const LoaderScreen();
          // }
          // // if (state is UserIsLoggedInLoadingState) {
          // //   return const Center(child: CircularProgressIndicator(color: Colors.orange));
          // // }
          return const LoaderScreen();
        },
      ),
    );
  }
}
