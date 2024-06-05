import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/authentication/widgets/custom_textfield_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
  });
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: getImageFromCamera,
                    child: Stack(
                      children: [
                        CircleAvatar(
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
                    controller: firstNameController, label: "First Name *"),
                const KHeight(size: 0.02),
                CustomTextFieldWidget(
                    controller: lastNameController, label: "Last Name *"),
                const KHeight(size: 0.02),
                CustomTextFieldWidget(
                    controller: mobileNoController, label: "Mobile Number *"),
                const KHeight(size: 0.02),
                CustomTextFieldWidget(
                    controller: passwordController, label: "Password *"),
                const KHeight(size: 0.02),
                CustomTextFieldWidget(
                    controller: addressController, label: "Address *"),
                const KHeight(size: 0.02),
                const CustomTextFieldWidget(label: "Detail *", maxLines: 4),
                const KHeight(size: 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: size.width * 0.45,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                            ),
                            backgroundColor:
                                WidgetStateProperty.all<Color>(Colors.orange),
                            foregroundColor:
                                WidgetStateProperty.all<Color>(Colors.white),
                          ),
                          child: const Text(
                            'Update',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
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
    );
  }
}
