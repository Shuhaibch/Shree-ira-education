import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: whiteColor),
          backgroundColor: themeColor,
          title: const CustomText(
            text: "My Courses",
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
            const Expanded(child: SingleChildScrollView(child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Column(children: [])))),
            Card(
                elevation: 2,
                color: whiteColor,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Container(
                          decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 255, 0, 0), Color.fromARGB(255, 255, 153, 0)])),
                          height: size.height * 0.058,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(
                                    Colors.transparent,
                                  ),
                                  shadowColor: const WidgetStatePropertyAll(
                                    Colors.transparent,
                                  ),
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
                                text: "Amount : 10000   Continue To Payment >>",
                                color: whiteColor,
                              )))
                    ])))
          ])
        ]),
      ),
    );
  }
}
