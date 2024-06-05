import 'package:flutter/material.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';

class VideoDetailWidget extends StatelessWidget {
  const VideoDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Positioned(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: size.height * 0.24,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: whiteColor,
                          size: 16,
                        )),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: whiteColor,
                          size: 20,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_border_outlined,
                          color: whiteColor,
                          size: 20,
                        ))
                  ]),
                  const KHeight(size: 0.04),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.skip_previous,
                          color: whiteColor,
                          size: 22,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow,
                          color: whiteColor,
                          size: 28,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.skip_next,
                          color: whiteColor,
                          size: 22,
                        ))
                  ]),
                  const Spacer(),
                  Row(children: [
                    const CustomText(
                      text: "1:20",
                      color: whiteColor,
                    ),
                    const Spacer(),
                    const CustomText(
                      text: "1:20",
                      color: whiteColor,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.zoom_out_map_rounded,
                          color: whiteColor,
                          size: 20,
                        ))
                  ]),
                  SizedBox(
                      height: size.height * 0.005,
                      child: const LinearProgressIndicator(
                        backgroundColor: Color.fromARGB(255, 215, 212, 212),
                        value: 0.8,
                        valueColor: AlwaysStoppedAnimation<Color>(redColor),
                      ))
                ]))));
  }
}
