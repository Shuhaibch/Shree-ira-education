import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class CartItemCardWidget extends StatelessWidget {
  const CartItemCardWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.asset(
                "assets/images/home.png",
                height: size.height * 0.123,
                width: size.width * 0.214,
                fit: BoxFit.cover,
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                    width: size.width * 0.5,
                    child: const CustomText(
                      text: "UX Design - From Wireframe to Prototype logo UX Design",
                      maxLines: 2,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                    width: size.width * 0.56,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      const Column(children: [
                        CustomText(
                          text: "INR.5000",
                          fontSize: 12,
                        ),
                        CustomText(
                          text: "INR.5000",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )
                      ]),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                            color: redColor,
                          ))
                    ]))
              ]))
        ]));
  }
}
