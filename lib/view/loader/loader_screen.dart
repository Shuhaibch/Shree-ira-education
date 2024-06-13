import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shreeiraeducation/commen/widget/image/circular_image.dart';
import 'package:shreeiraeducation/view/authentication/screens/login_screen.dart';
import 'package:shreeiraeducation/view/home/screens/home_screen.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  void initState() {
    super.initState();

    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    if (token != null) {
      log(token.toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
    // Navigator.pushReplacement(context,
    //       MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: CRoundedImage(imageUrl: 'assets/logo/landing_1.png')),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 28.0),
                child: CRoundedImage(
                  imageUrl: 'assets/logo/landing_2.png',
                  applyImageRadius: false,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
