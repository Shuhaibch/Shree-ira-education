import 'package:flutter/material.dart';

class CSnackBar {
  static void showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(content),
          backgroundColor: Colors.green,
        ),
      );
  }

  static void showErrorSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(content),
          backgroundColor: Colors.red,
        ),
      );
  }

// void showSnackBar(BuildContext context, String content) {
//   ScaffoldMessenger.of(context)
//     ..hideCurrentSnackBar()
//     ..showSnackBar(
//       SnackBar(
//         content: Text(content),
//       ),
//     );
// }
}
