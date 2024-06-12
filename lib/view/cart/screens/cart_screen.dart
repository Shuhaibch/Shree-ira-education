

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/snack_bar/snackbar.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/cart/bloc/bloc/cart_bloc.dart';
import 'package:shreeiraeducation/view/cart/widgets/cart_bottom_card_widget.dart';
import 'package:shreeiraeducation/view/cart/widgets/cart_item_card_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: whiteColor),
        backgroundColor: themeColor,
        title: const CustomText(
          text: "Cart",
          color: whiteColor,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: whiteColor,
            ),
          )
        ],
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is DeleteCartCourseSuccessState) {
            CSnackBar.showSuccessSnackBar(context, 'Course Removed');
            context.read<CartBloc>().add(const GetCartCourseEvent());
          }
        },
        builder: (context, state) {
          if (state is GetCartCourseLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
          if (state is DeleteCartCourseLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }

          if (state is GetCartCourseSuccessState) {
            return SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    color: themeColor,
                    height: size.height * 0.09,
                  ),
                  state.course.isEmpty
                      ? const Center(
                          child: Text('Cart Is Empty'),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: CartItemCardWidget(
                                  size: size,
                                  course: state.course[0],
                                ),
                              ),
                            ),
                            CartBottomCardWidget(size: size)
                          ],
                        )
                ],
              ),
            );
          }
          return SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  color: themeColor,
                  height: size.height * 0.09,
                ),
                Column(
                  children: [
                    const Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text('Cart Is Empty')),
                      ),
                    ),
                    CartBottomCardWidget(size: size)
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
