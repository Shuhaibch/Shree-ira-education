import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
        top: size.height * 0.23,
        left: 20,
        right: 20,
        child: Container(
            decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(12.0), boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ]),
            child: TextFormField(
                decoration: InputDecoration(
              hintText: 'Search for course, mentor, topic, etc.',
              hintStyle: const TextStyle(color: greyColor),
              filled: true,
              fillColor: whiteColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Color.fromARGB(255, 199, 189, 189)),
              ),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: redColor,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            ))));
  }
}
