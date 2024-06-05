import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/authentication/widgets/custom_textfield_widget.dart';
import 'package:shreeiraeducation/view/payment/screens/payment_screen.dart';

class CartBottomCardWidget extends StatelessWidget {
  const CartBottomCardWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        color: whiteColor,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                  height: size.height * 0.058,
                  width: size.width * 0.52,
                  child: const CustomTextFieldWidget(label: "Apply Coupon Code"),
                ),
                const SizedBox(width: 8),
                SizedBox(
                    height: size.height * 0.058,
                    width: size.width * 0.35,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(themeColor),
                            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(color: greyColor),
                            ))),
                        onPressed: () {},
                        child: const CustomText(
                          text: "Apply",
                          color: whiteColor,
                        )))
              ]),
              const SizedBox(height: 8),
              SizedBox(
                  height: size.height * 0.058,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(redColor),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: greyColor),
                          ))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PaymentScreen(),
                        ));
                      },
                      child: const CustomText(
                        text: "Proceed to Pay",
                        color: whiteColor,
                      )))
            ])));
  }
}
