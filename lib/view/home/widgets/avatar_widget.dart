// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';

// class AvatarEditPopup extends StatefulWidget {
//   const AvatarEditPopup({super.key});

//   @override
//   _AvatarEditPopupState createState() => _AvatarEditPopupState();
// }

// class _AvatarEditPopupState extends State<AvatarEditPopup> {
//   // final ImageSelector _imageSelector = ImageSelector();
//   final TextEditingController _usernameController = TextEditingController();

//   // Future<void> _getImage() async {
//   //   XFile? pickedImage = await _imageSelector.pickImage();
//   //   if (pickedImage != null) {
//   //     setState(() {
//   //       _userData.imageFile = File(pickedImage.path); // Save the image
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text(
//         'Edit Profile',
//         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//       ),
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           GestureDetector(
//             // onTap: _getImage,
//             child: const CircleAvatar(
//               radius: 40,
//               backgroundImage: AssetImage(
//                 "assets/images/FM9 Logo.png",
//               ),
//             ),
//           ),
//           const KHeight(size: 0.02),
//           TextField(
//             controller: _usernameController,
//             decoration: const InputDecoration(
//               contentPadding: EdgeInsets.fromLTRB(14, 4, 0, 4),
//               hintText: "Name",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//               ),
//             ),
//           ),
//           const KHeight(size: 0.02),
//           ElevatedButton(
//             onPressed: () {
//               // _userData.username = _usernameController.text;
//               Navigator.pop(context);
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }
// }
