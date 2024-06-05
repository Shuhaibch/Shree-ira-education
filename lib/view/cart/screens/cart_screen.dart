import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
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
                  ))
            ]),
        body: SizedBox(
            height: size.height,
            child: Stack(children: [
              Container(
                color: themeColor,
                height: size.height * 0.09,
              ),
              Column(children: [
                Expanded(
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                children: List.generate(
                                    4,
                                    (index) => Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: CartItemCardWidget(size: size),
                                        )))))),
                CartBottomCardWidget(size: size)
              ])
            ])));
  }
}
