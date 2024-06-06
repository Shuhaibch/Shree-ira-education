import 'package:flutter/material.dart';
import 'package:shreeiraeducation/commen/widget/custom_shape/container/circular_continer.dart';
import 'package:shreeiraeducation/commen/widget/image/circular_image.dart';
import 'package:shreeiraeducation/commen/widget/shimmer/shimmer_effect.dart';
import 'package:shreeiraeducation/commen/widget/shimmer/text_shimmer_effect.dart';
import 'package:shreeiraeducation/view/edit_profile/screens/edit_profile_screen.dart';

import '../../../../models/user/user_model.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/size/constant_height/constant_height.dart';
import '../../../../utils/text/custom_text.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return DrawerHeader(
      decoration: const BoxDecoration(color: themeColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              user.userImg == null
                  ? CRoundedImage(
                      imageUrl: 'assets/images/user.jpg',
                      applyImageRadius: true,
                      borderRadius: 60,
                      width: size.width * .195,
                      height: size.height * .09,
                    )
                  : CRoundedImage(
                      imageUrl:
                          'http://axnoldigitalsolutions.in/Training/images/user_img/${user.userImg!}',
                      applyImageRadius: true,
                      isNetworkImage: true,
                      borderRadius: 60,
                      width: size.width * .195,
                      height: size.height * .09,
                      fit: BoxFit.cover,
                    ),
              Positioned(
                bottom: -12,
                right: 0,
                left: 50,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(
                          user: user,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: whiteColor,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          const KHeight(size: 0.01),
          CustomText(
            text: user.fname,
            fontSize: 16,
            color: whiteColor,
            fontWeight: FontWeight.bold,
          ),
          CustomText(
            text: user.email,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          )
        ],
      ),
    );
  }
}

class DrawerHeaderLoadingWidget extends StatelessWidget {
  const DrawerHeaderLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return DrawerHeader(
      decoration: const BoxDecoration(color: themeColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CCircularContainer(
                width: size.width * .195,
                height: size.height * .09,
                radius: 60,
                child: CShimmerEffect(
                  width: size.width * .195,
                  height: size.height * .09,
                  radius: 60,
                ),
              ),
              Positioned(
                bottom: -12,
                right: 0,
                left: 50,
                child: IconButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const EditProfileScreen(user: ,),
                    //   ),
                    // );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: whiteColor,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          const KHeight(size: 0.01),
          TestShimmerWidget(
            height: size.height * .02,
            width: size.width * .2,
          ),
          const KHeight(size: 0.01),
          TestShimmerWidget(
            height: size.height * .02,
            width: size.width * .3,
          ),
        ],
      ),
    );
  }
}
