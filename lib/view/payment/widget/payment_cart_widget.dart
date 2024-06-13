import 'package:flutter/material.dart';
import 'package:shreeiraeducation/models/cart/cart_model.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class PaymentItemCardWidget extends StatelessWidget {
  const PaymentItemCardWidget({
    super.key,
    required this.size,
    required this.course,
  });
  final CartCourse course;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
            child: Image.asset(
              "assets/images/payment.jpg",
              height: size.height * 0.123,
              width: size.width * 0.214,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  child: const CustomText(
                    text: 'Payment',
                    maxLines: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(
                //   width: size.width * 0.56,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             "INR.${course.price ?? ''}",
                //             style: const TextStyle(
                //                 fontSize: 12,
                //                 decoration: TextDecoration.lineThrough,
                //                 decorationColor: Colors.red),
                //           ),
                //           CustomText(
                //             text: "INR.${course.courses!.discountPrice ?? ''}",
                //             fontWeight: FontWeight.bold,
                //             fontSize: 14,
                //           )
                //         ],
                //       ),
                //       IconButton(
                //         onPressed: () {
                //           context.read<CartBloc>().add(DeleteCartCourseEvent(
                //               courseId: course.courseId.toString()));
                //         },
                //         icon: const Icon(
                //           Icons.delete_outline_outlined,
                //           color: redColor,
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
