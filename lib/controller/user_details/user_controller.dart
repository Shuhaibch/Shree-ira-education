import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shreeiraeducation/models/user/user_model.dart';

class UserController {
  final String getUserDetailUrl =
      "http://axnoldigitalsolutions.in/Training/api/profile";
  final String updateProfileUrl =
      "http://axnoldigitalsolutions.in/Training/api/update-profile";

  //* Signin
  Future<Map<String, dynamic>> getUserDetails() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.get(
        Uri.parse(getUserDetailUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(response.body.toString());
        final UserModel user = UserModel.fromJson(jsonDecode(response.body));

        return {
          'response': 'success',
          'data': user.user,
        };
      } else {
        final resp = jsonDecode(response.body);
        return {
          'response': 'error',
          'message': 'Server error: ${resp['error']}',
        };
      }
    } catch (e) {
      return {
        'response': 'error',
        'message': 'Server error: ${e.toString()}',
      };
    }
  }

  //*************************************************************************************** */
//  Uri url = Uri.parse("https://api.escuelajs.co/api/v1/files/upload");
//     var request = http.MultipartRequest("POST", url);
//     var myFile = http.MultipartFile(
//       "file",
//       http.ByteStream.fromBytes(bytes),
//       bytes.length,
//       filename: fileName,
//     );
//     request.files.add(myFile);

//* updateuserDetails
  Future<Map<String, dynamic>> updateUserDetails({
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String password,
    required String address,
    required String detail,
    required XFile? image,
    required String? imageUrl,
  }) async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      if (image != null) {
        return uploadImageFunction(
            firstName: firstName,
            lastName: lastName,
            email: email,
            mobile: mobile,
            password: password,
            address: address,
            detail: detail,
            image: image,
            updateProfileUrl: updateProfileUrl);
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('token');
        final response = await http.post(
          Uri.parse(updateProfileUrl),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(
            {
              "fname": firstName,
              "lname": lastName,
              "email": email,
              "mobile": mobile,
              "password": password,
              "address": address,
              "detail": detail,
              "pic": imageUrl
            },
          ),
        );
        log(response.statusCode.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          log(response.body.toString());
          final UserModel user = UserModel.fromJson(jsonDecode(response.body));

          return {
            'response': 'success',
            'data': user.user,
          };
        } else {
          final resp = jsonDecode(response.body);
          return {
            'response': 'error',
            'message': 'Server error: ${resp['error']}',
          };
        }
      }
    } catch (e) {
      return {
        'response': 'error',
        'message': 'Server error: ${e.toString()}',
      };
    }
  }
}

//  Uint8List bytes = await image.readAsBytes();
//                         UploadApiImage()
//                             .uploadImage(bytes, image.name)
//                             .then((value) {
//                           setState(() {
//                             isImageUploade = value['location'].toString();
//                             isLoading =false;
//                           });
Future<Map<String, dynamic>> uploadImageFunction(
    {required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String password,
    required String address,
    required String detail,
    required XFile? image,
    required String updateProfileUrl}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Uint8List bytes = await image!.readAsBytes();

  var request = http.MultipartRequest("POST", Uri.parse(updateProfileUrl));
  final token = prefs.getString('token');

  Map<String, String> headers = {
    "Authorization": "Bearer $token",
    "Content-type": "multipart/form-data"
  };
  request.files.add(await http.MultipartFile.fromPath('pic', image!.path));

  // request.files.add(
  //   http.MultipartFile(
  //     'pic',
  //     File(image!.path).readAsBytes().asStream(),
  //     File(image.path).lengthSync(),
  //     filename: image.path.split("/").last,
  //   ),
  // );

  // var myFile = http.MultipartFile(
  //   "pic",
  //   http.ByteStream.fromBytes(bytes),
  //   bytes.length,
  //   filename: image.name,
  //   contentType: MediaType('image','jpeg')
  // );
  // request.files.add(myFile);

  request.headers.addAll(headers);

  request.fields.addAll({
    "fname": firstName,
    "lname": lastName,
    "email": email,
    "mobile": mobile,
    "password": password,
    "address": address,
    "detail": detail,
  });

  // var response = await request.send();
  // log(response.statusCode.toString());
  http.Response response = await http.Response.fromStream(await request.send());
  print("Result: ${response.statusCode}");
  log(response.statusCode.toString());
  if (response.statusCode == 200 || response.statusCode == 201) {
    // log(response.body.toString());
    // final UserModel user = UserModel.fromJson(jsonDecode(response.body));
    // log(response.stream. toString());

    log(response.body.toString());
    return {
      'response': 'success',
      'data': 'user.user',
    };
  } else {
    // final resp = jsonDecode(response.body);
    return {
      'response': 'error',
      'message': 'Server error: {resp[]}',
    };
  }
}
