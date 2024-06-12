import 'package:flutter/material.dart';

class CSnackBar {
  static void showSuccessSnackBar(BuildContext context, String content) {
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

static void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange,
        content: Text(content),
      ),
    );
}
}
