import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/models/cart/cart_model.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/snack_bar/snackbar.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/cart/bloc/bloc/cart_bloc.dart';
import 'package:shreeiraeducation/view/home/screens/home_screen.dart';
import 'package:shreeiraeducation/view/my_courses/bloc/my_course_bloc/my_course_bloc.dart';
import 'package:shreeiraeducation/view/payment/widget/payment_cart_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.course});
  final CartCourse course;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: whiteColor),
        backgroundColor: themeColor,
        title: const CustomText(
          text: "Payment",
          color: whiteColor,
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.search,
        //       color: whiteColor,
        //     ),
        //   )
        // ],
      ),
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Container(
              color: themeColor,
              height: size.height * 0.09,
            ),
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          PaymentItemCardWidget(size: size, course: course)
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  color: whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 255, 0, 0),
                                Color.fromARGB(255, 255, 153, 0)
                              ],
                            ),
                          ),
                          height: size.height * 0.058,
                          width: double.infinity,
                          child: BlocConsumer<CartBloc, CartState>(
                            listener: (context, state) {
                              if (state is CourseCheckOutSuccessState) {
                                context
                                    .read<MyCourseBloc>()
                                    .add(GetMyEnrolledCoursesEvent());
                                CSnackBar.showSuccessSnackBar(context,
                                    'Course Purchased, Happy Learning');
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                              }
                              if (state is CourseCheckOutFailedState) {
                                CSnackBar.showErrorSnackBar(
                                    context, 'Failed to CheckOut');
                              }
                            },
                            builder: (context, state) {
                              return ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(
                                    Colors.transparent,
                                  ),
                                  shadowColor: const WidgetStatePropertyAll(
                                    Colors.transparent,
                                  ),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(color: greyColor),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CourseCheckOutEvent());
                                },
                                child: state is CourseCheckOutLoadingState
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : CustomText(
                                        text:
                                            "Amount : ${course.offerPrice}   Continue To Payment >>",
                                        color: whiteColor,
                                      ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
