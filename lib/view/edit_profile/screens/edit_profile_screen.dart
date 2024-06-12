import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shreeiraeducation/commen/widget/image/circular_image.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/snack_bar/snackbar.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/authentication/widgets/custom_textfield_widget.dart';
import 'package:shreeiraeducation/view/edit_profile/bloc/bloc/edit_user_bloc.dart';
import 'package:shreeiraeducation/view/home/screens/home_screen.dart';
import 'package:shreeiraeducation/view/home/widgets/drawer/bloc/user/user_bloc.dart';

import '../../../models/user/user_model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.user});
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
  final User user;
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    firstNameController.text = widget.user.fname;
    lastNameController.text = widget.user.lname;
    widget.user.mobile != null
        ? mobileNoController.text = widget.user.mobile!
        : null;
    widget.user.address != null
        ? addressController.text = widget.user.address!
        : null;
    widget.user.detail != null
        ? detailsController.text =
            widget.user.detail!.replaceAll('<p>', '').replaceAll('</p>', '')
        : null;
    super.initState();
  }

  File? _image;
  XFile? pickedFile;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile!.path);
        widget.user.userImg = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: whiteColor,
            ),
          ),
          title: const Center(
            child: CustomText(
              text: "Edit Profile",
              color: whiteColor,
            ),
          ),
          actions: const [
            Icon(
              Icons.more_vert_rounded,
              color: whiteColor,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 18,
            left: 30,
            right: 30,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: getImageFromCamera,
                      child: Stack(
                        children: [
                          widget.user.userImg != null
                              ? CRoundedImage(
                                  isNetworkImage: true,
                                  applyImageRadius: true,
                                  borderRadius: 60,
                                  imageUrl:
                                      'http://axnoldigitalsolutions.in/Training/images/user_img/${widget.user.userImg!}',
                                  width: size.width * 0.3,
                                  height: size.height * 0.14,
                                  fit: BoxFit.cover,
                                )
                              : CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.grey[200],
                                  child: _image != null
                                      ? ClipOval(
                                          child: Image.file(
                                            _image!,
                                            width: size.width * 0.6,
                                            height: size.height * 0.3,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : const Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                          size: 40,
                                        ),
                                ),
                          Positioned(
                            bottom: 0,
                            left: 80,
                            right: 25,
                            child: IconButton(
                              onPressed: getImageFromCamera,
                              icon: const Icon(Icons.camera_alt),
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const KHeight(size: 0.03),
                  CustomTextFieldWidget(
                    controller: firstNameController,
                    label: "First Name *",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter FirstName';
                      }
                      return null;
                    },
                  ),
                  const KHeight(size: 0.02),
                  CustomTextFieldWidget(
                    controller: lastNameController,
                    label: "Last Name *",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter LastName';
                      }
                      return null;
                    },
                  ),
                  const KHeight(size: 0.02),
                  CustomTextFieldWidget(
                    controller: mobileNoController,
                    label: "Mobile Number *",
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Phone Number';
                      }
                      return null;
                    },
                  ),
                  const KHeight(size: 0.02),
                  CustomTextFieldWidget(
                    controller: passwordController,
                    label: "Password *",
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        if (value.length < 6) {
                          return 'Password must me greater than 6 digit';
                        }
                      }
                      return null;
                    },
                  ),
                  const KHeight(size: 0.02),
                  CustomTextFieldWidget(
                    controller: addressController,
                    label: "Address *",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Address';
                      }
                      return null;
                    },
                  ),
                  const KHeight(size: 0.02),
                  CustomTextFieldWidget(
                    label: "Detail *",
                    maxLines: 4,
                    controller: detailsController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Address';
                      }
                      return null;
                    },
                  ),
                  const KHeight(size: 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: size.width * 0.45,
                          child: BlocConsumer<EditUserBloc, EditUserState>(
                            listener: (context, state) {
                              if (state is UpdateUserDetailsFailedState) {
                                CSnackBar.showErrorSnackBar(
                                    context, state.errorMsg);
                              }
                              if (state is UpdateUserDetailsSuccessState) {
                                BlocProvider.of<UserBloc>(context)
                                    .add(GetUserDetailsEvent());

                                CSnackBar.showSuccessSnackBar(
                                    context, 'Profile Updated Successfully');
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ));
                              }
                            },
                            builder: (context, state) {
                              if (state is UpdateUserDetailsLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.orange,
                                  ),
                                );
                              }
                              return ElevatedButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    if (pickedFile != null) {
                                      context
                                          .read<EditUserBloc>()
                                          .add(UpdateUserDetailsEvent(
                                            mobile:
                                                mobileNoController.text.trim(),
                                            fname:
                                                firstNameController.text.trim(),
                                            lname:
                                                lastNameController.text.trim(),
                                            address:
                                                addressController.text.trim(),
                                            password:
                                                passwordController.text.trim(),
                                            imageUrl: null,
                                            details:
                                                detailsController.text.trim(),
                                            email: widget.user.email,
                                            image: pickedFile,
                                          ));
                                    } else {
                                      context
                                          .read<EditUserBloc>()
                                          .add(UpdateUserDetailsEvent(
                                            mobile:
                                                mobileNoController.text.trim(),
                                            fname:
                                                firstNameController.text.trim(),
                                            lname:
                                                lastNameController.text.trim(),
                                            address:
                                                addressController.text.trim(),
                                            password:
                                                passwordController.text.trim(),
                                            imageUrl: widget.user.userImg,
                                            details:
                                                detailsController.text.trim(),
                                            email: widget.user.email,
                                            image: null,
                                          ));
                                    }
                                  }
                                },
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                  ),
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          Colors.orange),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                child: const Text(
                                  'Update',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
